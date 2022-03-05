/*
 * EFES_finalproject.cpp
 *
 * Created: 4/3/2022 22:45:00
 * Author : Marcos
 */ 

#include "math.h"
#include "button/button.h"
#include "timer1/timer1.h"
#include "timer2/timer2.h"
#include "UART/uart.h"
#include "buffer/buffer.h"
#include "misc/format_converter.h"
#include "misc/signal_generation.h"
#include "parallel_port/parallel_port.h"
#include "EEPROM/eeprom.h"
#include "IncFile.h"

//DELETE VOLATILE AFTER CHANGING CODE AND CHECKING THAT THE VARIABLE IS NOT MODIFIED DURING AN INTERRUPT
uint8_t wave_samples[WAVE_SAMPLES_LENGTH]; //we add N taps-1 in order to do a circular convolution, so we obtain a complete cycle of the output signal ignoring
//the fist output values when all the values of the filter are 0.

static uint16_t clk_cycle = 0; //variable to save the current clock cycle, in order to know when to set the reset pin and when to start transmitting data
static uint8_t wave_selector = 0;
static uint8_t data_in_memory = 0;
volatile uint8_t selection_flag = 0;

//#define LENGTH 15 // Length of the wave lookup table
//uint8_t wave[LENGTH]; // Storage for waveform
//uint8_t read_wave[LENGTH]; 


volatile uint16_t counter = 0;
volatile uint16_t count_timer0 = 0;
volatile uint16_t PWM_duty_cycle = 0;
volatile uint8_t flag=0;


/*
*	First I have to generate the wave and also save it in the memory
*	*I need 1 global array to save the values
*	Use this arrays with the values to transmit the data and at the same time save the input values (in order to save memory)
*	Things to take care:
*	-- Number of samples (fs = k*fmax)
*	-- Which are the first values that should be filter (circular convolution)
*	-- When should I start sampling the data, in order to save a complete cycle of the filterer signal.
*	-- All this three things, see them in matlab	
*/

void filter_data(void);
void pwm_out(void);
void analog_signal_out(void);
void generate_data(void);

int main(void)
{
    USART_Init(57600);
    buttonsInit();

    while (1) 
    {
		switch (selection_flag){
			case FILTER_DATA_FLAG:
				filter_data();
				break;
			case POWER_PWM_FLAG:
				pwm_out();
				break;
			case ANALOG_OUTPUT_FLAG:
				analog_signal_out();
				break;
			case GENERATE_DATA_FLAG:
				generate_data();
				break;
			default:
				break;
		}
		
		
		}
		
    
}

void filter_data(void){
	
	
	if(!(PINB & (1 << PINB2))){ //see if the edge was a negative to change the outputs and read the inputs (read in the middle of a clock cycle)
		if(clk_cycle < 1){ //The first cycle we set the reset signal
			PORTD &=  ~( 1UL << DDD0 );     /// reset = '0' (reset is active low)
			clk_cycle++;
		}
		/*
		*	After the first clock cycle we start sending data and reading data.
		*	The first N_taps+Pipeline_Depth cycles we don't read data because the 
		*	values in the filter are all 0s and there is a delay in the data output
		*	due to the pipeline architecture of the filter
		*/
		else if(clk_cycle>=N_TAPS+PIPELINE_DEPTH+1 && clk_cycle < WAVE_SAMPLES_LENGTH){ 
			
			
			PORTD = ( 1UL << DDD0 ) | (PIND&0x0F) | ((wave_samples[clk_cycle-1] & 0x0F)<<4);//out a value MSB[PB4, PB1, PD7, PD6, PD5, PD4]LSB, Here I also assure that reset = '0'
			PORTB = (PINB & 0xED) | ((wave_samples[clk_cycle-1] & 0x10)>>3) | ((wave_samples[clk_cycle-1] & 0x20)>>1); //(data_out & 0x20)= MSB of the data out, (data_out & 0x10)=MSB-1 of the data out	
			
			//uint16_t valor = (PINB & 0x20) | ((PINC & 0x3E)>>1);//clk_cycle-1-(N_TAPS+PIPELINE_DEPTH);//read an input value MSB[PB5, PC5, PC4, PC3, PC2, PC1]LSB
			//volatile uint8_t value_sent = ((PINB & 0x10)<<1)|((PINB & 0x02)<<3)|((PIND & 0xF0)>>4);
			char value[5]; //DEBUG
			wave_samples[clk_cycle-1-(N_TAPS+PIPELINE_DEPTH)] = (PINB & 0x20) | ((PINC & 0x3E)>>1);//read an input value MSB[PB5, PC5, PC4, PC3, PC2, PC1]LSB
			//int2str4dig(clk_cycle,value,1); //DEBUG
			int2str4dig(wave_samples[clk_cycle-1-(N_TAPS+PIPELINE_DEPTH)],value,1); //DEBUG
			clk_cycle++;
			print_string_pooling(value,5); //DEBUG
			
		}
		/*
		* We first have to fill the filter with N_TAPS samples and wait PIPELINE_DEPTH 
		* cycles to then start saving data, so the first N_TAPS+PIPELINE_DEPTH input 
		* values has to be ignored 
		*/
		else if(clk_cycle >= 1 && clk_cycle <N_TAPS+PIPELINE_DEPTH+1){
			
			PORTD = ( 1UL << DDD0 ) | (PIND&0x0F) | ((wave_samples[clk_cycle-1] & 0x0F)<<4);//out a value MSB[PB4, PB1, PD7, PD6, PD5, PD4]LSB, Here I also assure that reset = '0'
			PORTB = (PINB & 0xED) | ((wave_samples[clk_cycle-1] & 0x10)>>3) | ((wave_samples[clk_cycle-1] & 0x20)>>1); //(data_out & 0x20)= MSB of the data out, (data_out & 0x10)=MSB-1 of the data out
			clk_cycle++;				   
			/*
			char value[5]; //DEBUG
			volatile uint8_t value_sent = ((PINB & 0x10)<<1)|((PINB & 0x02)<<3)|((PIND & 0xF0)>>4);
			int2str4dig(value_sent,value,1); //DEBUG
			print_string_pooling(value,5); //DEBUG*/
			
			
			
		}
		/*
		* We have already sent all the data, we only have to read the last PIPELINE_DEPTH output values 
		* We don't have to send any more data
		*/
		else if(clk_cycle>=WAVE_SAMPLES_LENGTH && clk_cycle < WAVE_SAMPLES_LENGTH+PIPELINE_DEPTH+2){
			
			wave_samples[clk_cycle-1-(N_TAPS+PIPELINE_DEPTH)] = (PINB & 0x20) | ((PINC & 0x3E)>>1);//read an input value MSB[PB5, PC5, PC4, PC3, PC2, PC1]LSB
			
			char value[5]; //DEBUG
			int2str4dig(wave_samples[clk_cycle-1-(N_TAPS+PIPELINE_DEPTH)],value,1); //DEBUG
			clk_cycle++;
			print_string_pooling(value,5); //DEBUG
		}
		else{ 
			TCCR1B = 0; //No clock source-> communication done, disable timer1 
			clk_cycle = 0;
			flag = 1;
			EEPROM_update_batch(RX_SIGNAL_START_ADDRESS,wave_samples,N_SAMPLES);
			print_string_pooling("writing new data\n",17); //DEBUG
		}
		
			
	}
	selection_flag = 0;
}
void pwm_out(void){
	
}
void analog_signal_out(void){
	
	print_string_pooling("SHOW ANALOG SIGNAL\n",19);// DEBUG
		
		
		DisableADC();
		if(!wave_selector){
			EEPROM_read_batch(TX_SIGNAL_START_ADDRESS, wave_samples,N_SAMPLES);
			wave_selector = 1;
			print_string_pooling("original signal\n",16);
		}
		else{
			EEPROM_read_batch(RX_SIGNAL_START_ADDRESS, wave_samples,N_SAMPLES);
			wave_selector = 0;
			print_string_pooling("filtered signal\n",16);
		}
		/*for (int i=0; i<N_SAMPLES; i++) { // Step across wave table
			float v = (AMP*(0.85*sin((PI2/N_SAMPLES)*i)+0.15*sin((KFO*PI2/N_SAMPLES)*i))); // Compute value
			wave_samples[i] = uint8_t(v+OFFSET); // Store value as integer
		}*/
		//Start PWM to show signal
		fastPWMStart_T1();
		timer2Init();
		timer2SetIntOnMatch();
		selection_flag = 0;
}

void generate_data(void){
	if(!data_in_memory) {
		print_string_pooling("Generating data\n",16);
		//GENERATE DATA
		generate_sine();
		//disable interrupts while data is being saved in memory
		cli();
		//save it in memory
		EEPROM_update_batch(TX_SIGNAL_START_ADDRESS, &wave_samples[HALF_N_TAPS],N_SAMPLES);
		data_in_memory = 1;
	}
	else{
		print_string_pooling("Data already generated, reading from memory\n",44);
		//disable interrupts while data is being read from the memory
		cli();
		EEPROM_read_batch(TX_SIGNAL_START_ADDRESS, &wave_samples[HALF_N_TAPS],N_SAMPLES);
		//Fill the N_TAPS/2 values at the beginning and at the end of the array for the circular convolution
		for (int i =0 ; i<HALF_N_TAPS ;i++){
			wave_samples[i] = wave_samples[i+N_SAMPLES];
			wave_samples[i+N_SAMPLES+HALF_N_TAPS] = wave_samples[i+HALF_N_TAPS];
		}
	}
	
	sei();
	
	//Initialize port and filter data
	DisableADC();
	TCCR2B = 0; //disabling timer 2
	parallelPortInit();
	portClockInit();
	//Save filtered data in memory I SHOULD DELETE THIS
	//EEPROM_update_batch(RX_SIGNAL_START_ADDRESS,wave_samples,N_SAMPLES);
	selection_flag = 0;
}
