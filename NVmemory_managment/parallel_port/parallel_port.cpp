/*
 * parallel_port.cpp
 *
 * Created: 16/2/2022 15:17:33
 *  Author: Marcos
 */ 

#include "../UART/uart.h"
#include "parallel_port.h"
#include "../incfile.h"

//#define communication_length 50 //number of clock cycles that the communication should last 
static uint16_t clk_cycle = 0; //variable to save the current clock cycle, in order to know when to set the reset pin and when to start transmitting data

	
	
extern volatile uint8_t flag;
extern uint8_t wave_samples[];

void parallelPortInit(){
	/////////**** setup input parallel port ****///////////////// PC1,PC2,PC3,PC4,PC5,PB5
	DDRC  &= ~(( 1UL << DDC1 ) |(1UL << DDC2)|(1UL << DDC3)|(1UL << DDC4)|(1UL << DDC5));     /// Set PC1,PC2,PC3,PC4,PC5 and PB5 now as input
	DDRB &= ~(1UL << DDB5); //set PB5 as input
	PORTC &=  ~(( 1UL << DDC1 ) |(1UL << DDC2)|(1UL << DDC3)|(1UL << DDC4)|(1UL << DDC5));     /// disable pull up of PC1,PC2,PC3,PC4,PC5
	PORTB &= ~(1UL << DDB5);      /// disable pull up of PB5
		
	/////////**** setup output parallel port ****///////////////
	DDRD  |= (( 1UL << DDD4 ) |(1UL << DDD5)|(1UL << DDD6)|(1UL << DDD7));     /// Set PD4,PD5,PD6,PD7,PB1 and PB4 as output
	DDRB |= ((1UL << DDB1)|(1UL << DDB4)); //set PB1 and PB4 as output
	PORTD &=  ~(( 1UL << DDD4 ) |(1UL << DDD5)|(1UL << DDD6)|(1UL << DDD7));     /// parallel output = '000000'
	PORTB &=  ~((1UL << DDB1)|(1UL << DDB4));     /// parallel output = '000000'
	
	///////**** Reset pin **** ////////////
	DDRD  |= ( 1UL << DDD0 );     /// Set PD0 output
	PORTD &=  ~( 1UL << DDD0 );     /// reset = '0'
	
}



void portClockInit(){ //Pin with the signal clock 10 (OC1B)
	
		// Set PB2 to be an output (Pin10 Arduino UNO)
		DDRB |= (1 << DDB2);
		
		TCCR1A = 0; //clearing previous timer 1 configuration
		TCCR1A |= (1 << COM1B0); // toggle OC1B on compare match
		TCCR1A &= ~((1 << WGM10)|(1 << WGM10)); //mode of operation: CTC
		TCCR1B = 0 ; //clearing previous timer 1 configuration
		TCCR1B |= (1 << WGM12); //mode of operation: CTC
		TCCR1B |= (1 << CS12); // Set prescaler to 256


		OCR1B = 31; //16 is the value to obtain a 1kHz clock
		OCR1A = 31;
		TIMSK1 = 1<<OCIE1B;//clearing previous timer 1 configuration and output compare B match interrupt enable
		sei();
	
}

ISR(TIMER1_COMPB_vect){
	//print_string_pooling("int/n",4);
	//uint8_t *data_out = data_out_array;
	///uint8_t *data_in = data_in_array;
	//flag = 0;
	if(!(PINB & (1 << PINB2))){ //see if the edge was a negative to change the outputs and read the inputs (read in the middle of a clock cycle)
		if(clk_cycle < 1){ //The first cycle we set the reset signal
			PORTD |=  ( 1UL << DDD0 );     /// reset = '1'
			clk_cycle++;
		}
		/*
		*	After the first clock cycle we start sending data and reading data.
		*	The first N_taps+Pipeline_Depth cycles we don't read data because the 
		*	values in the filter are all 0s and there is a delay in the data output
		*	due to the pipeline architecture of the filter
		*/
		else if(clk_cycle>=N_TAPS+PIPELINE_DEPTH && clk_cycle < WAVE_SAMPLES_LENGTH+N_TAPS){ 
			
			PORTD = (PORTD&0x0E) | ((wave_samples[clk_cycle-1] & 0x0F)<<4);//out a value MSB[PB4, PB1, PD7, PD6, PD5, PD4]LSB, Here I also assure that reset = '0'
			PORTB = (PORTB & 0xED) | ((wave_samples[clk_cycle-1] & 0x10)>>3) | ((wave_samples[clk_cycle-1] & 0x20)>>1); //(data_out & 0x20)= MSB of the data out, (data_out & 0x10)=MSB-1 of the data out	
			wave_samples[clk_cycle-1-(N_TAPS+PIPELINE_DEPTH)] = (PINB & 0x20) | ((PINC & 0x3E)>>1);//read an input value MSB[PB5, PC5, PC4, PC3, PC2, PC1]LSB
			clk_cycle++;				   
		}
		/*
		* We first have to fill the filter with N_TAPS samples and wait PIPELINE_DEPTH 
		* cycles to then start saving data, so the first N_TAPS+PIPELINE_DEPTH input 
		* values has to be ignored 
		*/
		else if(clk_cycle >= 1 && clk_cycle <N_TAPS+PIPELINE_DEPTH){
			
			PORTD = (PORTD&0x0E) | ((wave_samples[clk_cycle-1] & 0x0F)<<4);//out a value MSB[PB4, PB1, PD7, PD6, PD5, PD4]LSB, Here I also assure that reset = '0'
			PORTB = (PORTB & 0xED) | ((wave_samples[clk_cycle-1] & 0x10)>>3) | ((wave_samples[clk_cycle-1] & 0x20)>>1); //(data_out & 0x20)= MSB of the data out, (data_out & 0x10)=MSB-1 of the data out
			clk_cycle++;				   
			
			
			
		}
		/*
		* We have already sent all the data, we only have to read the last PIPELINE_DEPTH output values 
		* We don't have to send any more data
		*/
		else if(clk_cycle>=WAVE_SAMPLES_LENGTH+N_TAPS && clk_cycle < WAVE_SAMPLES_LENGTH+N_TAPS+PIPELINE_DEPTH){
			
			wave_samples[clk_cycle-1-(N_TAPS+PIPELINE_DEPTH)] = (PINB & 0x20) | ((PINC & 0x3E)>>1);//read an input value MSB[PB5, PC5, PC4, PC3, PC2, PC1]LSB
			clk_cycle++;
		}
		else{ 
			TCCR1B = 0; //No clock source-> communication done, disable timer1 
			clk_cycle = 0;
			flag = 1;
		}
		
			
	}
	
}