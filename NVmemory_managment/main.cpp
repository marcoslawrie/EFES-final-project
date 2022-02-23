/*
 * NVmemory_managment.cpp
 *
 * Created: 19/2/2022 12:07:41
 * Author : Marcos
 */ 


#include "math.h"
#include "button/button.h"
#include "timer1/timer1.h"
#include "timer2/timer2.h"
#include "UART/uart.h"
#include "buffer/buffer.h"
#include "misc/format_converter.h"
#include "parallel_port/parallel_port.h"
#include "EEPROM/eeprom.h"
#include "IncFile.h"

//DELETE VOLATILE AFTER CHANGING CODE AND CHECKING THAT THE VARIABLE IS NOT MODIFIED DURING AN INTERRUPT
volatile uint8_t wave_samples[WAVE_SAMPLES_LENGTH]; //we add N taps-1 in order to do a circular convolution, so we obtain a complete cycle of the output signal ignoring
//the fist output values when all the values of the filter are 0.




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

int main(void)
{
    USART_Init(57600);
    buttonsInit();

	/*print_string_pooling("input signal\n",13); //debug
	u8buf my_buffer2; //DEBUG
	char value[5]; //DEBUG
	//EEPROM_update_batch(0, &wave_samples[HALF_N_TAPS],N_SAMPLES);
	for (int i=0; i<N_SAMPLES+N_TAPS-1; i++) { // Step across wave table
		//Printing input signal
		int2str4dig(wave_samples[i],value,1); //DEBUG
		BufferMultipleWrite(&my_buffer2,value,5); //DEBUG
		USART_TransmitInterrupt(&my_buffer2); //Using UART with interrupts
	}*/
	
	/*print_string_pooling("read signal\n",12);
	EEPROM_read_batch(0, wave_samples,N_SAMPLES);
	 //debug
		for (int i=0; i<N_SAMPLES; i++) { // Step across wave table
			//Printing input signal
			int2str4dig(wave_samples[i],value,1); //DEBUG
			BufferMultipleWrite(&my_buffer2,value,5);// DEBUG
			USART_TransmitInterrupt(&my_buffer2); //Using UART with interrupts
		}*/
	
    while (1) 
    {
		
		}
		
    
}




