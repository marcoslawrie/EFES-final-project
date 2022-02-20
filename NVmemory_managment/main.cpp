/*
 * NVmemory_managment.cpp
 *
 * Created: 19/2/2022 12:07:41
 * Author : Marcos
 */ 

#include <stdlib.h>
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "math.h"
#include "button/button.h"
#include "timer1/timer1.h"
#include "timer2/timer2.h"
#include "UART/uart.h"
#include "buffer/buffer.h"
#include "misc/format_converter.h"
#include "parallel_port/parallel_port.h"
#include "EEPROM/eeprom.h"


#define TX_SIGNAL_START_ADDRESS 0
#define RX_SIGNAL_START_ADDRESS 100
#define N_SAMPLES 100
#define EEPROM_LENGTH 1024



/******** Sine wave parameters ********/
#define PI2 6.283185 // 2*PI saves calculation later
#define AMP 127 // Scaling factor for sine wave
#define OFFSET 128 // Offset shifts wave to all >0 values

#define LENGTH 15 // Length of the wave lookup table
uint8_t wave[LENGTH]; // Storage for waveform
uint8_t read_wave[LENGTH]; 


volatile uint16_t counter = 0;
volatile uint16_t count_timer0 = 0;
volatile uint16_t PWM_duty_cycle = 0;
volatile uint8_t flag=0;


uint8_t EEPROM_update_batch(uint16_t uiAddress, void *data,uint16_t len);
uint8_t EEPROM_read_batch(uint16_t uiAddress, void *data,uint16_t len);

int main(void)
{
    USART_Init(57600);
    buttonsInit();
	//creating values of the output signal
	for (int i=0; i<LENGTH; i++) { // Step across wave table
		float v = (AMP*(0.85*sin((PI2/LENGTH)*i)+0.15*sin((15*PI2/LENGTH)*i))); // Compute value
		wave[i] = uint8_t(v+OFFSET); // Store value as integer
	}
	print_string_pooling("input signal\n",13); //debug
	u8buf my_buffer2; //DEBUG
	char value[5]; //DEBUG
	EEPROM_update_batch(0, wave,LENGTH);
	for (int i=0; i<LENGTH; i++) { // Step across wave table
		//Printing input signal
		int2str4dig(wave[i],value,1); //DEBUG
		BufferMultipleWrite(&my_buffer2,value,5); //DEBUG
		USART_TransmitInterrupt(&my_buffer2); //Using UART with interrupts
	}
	
	print_string_pooling("read signal\n",12);
	EEPROM_read_batch(0, read_wave,LENGTH);
	 //debug
		for (int i=0; i<LENGTH; i++) { // Step across wave table
			//Printing input signal
			int2str4dig(read_wave[i],value,1); //DEBUG
			BufferMultipleWrite(&my_buffer2,value,5);// DEBUG
			USART_TransmitInterrupt(&my_buffer2); //Using UART with interrupts
		}
	
    while (1) 
    {
		
    }
}




