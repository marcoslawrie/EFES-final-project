/*
 * ADC_test.cpp
 *
 * Created: 12/12/2021 16:20:34
 * Author : Marcos
 */ 
#include <stdlib.h>
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>  // Generates a Blocking Delay
#include "UART/uart.h"
#include "misc/format_converter.h"
#include "ADC/adc.h"
#include "timer0/timer0.h"

#define F_CPU 16000000UL
#define USART_BAUDRATE 9600
#define UBRR_VALUE (((F_CPU / (USART_BAUDRATE * 16UL))) - 1)
#define ADCINDEX 20
//store ADC values
uint8_t wave[ADCINDEX];
volatile uint8_t ii=0;
volatile uint8_t flag=0;

u8buf my_buffer;
//uint16_t *adcResult;

//initialize debug ports
void InitPort(void)
{
	//set PD6 and PD2 as output
	DDRD |= (1<<PD2)|(1<<PD6);
}


int main()
{
	uint16_t convertionResult;
	
	//Initialize USART0
	 USART_Init();
	//initialize ports
	InitPort();
	//initialize ADC
	InitADC(&convertionResult);
	//select ADC channel
	SetADCChannel(0);
	//initialize timer0
	InitTimer0();
	//start timer0
	StartTimer0();
	//start conversion
	StartADC();
	//enable global interrupts
	sei();
	while(1)
	{
			u8buf my_buffer2;

		if (1)
		{
			//clear global interrupts
			//cli();
			//print stored ADC values via USART
			
			ii=0;
			char USART_TransmitBuffer[] ="ADC values\n"; // Global Buffer
			int8_t data_length = sizeof(USART_TransmitBuffer)/sizeof(USART_TransmitBuffer[0]);
			BufferMultipleWrite(&my_buffer,USART_TransmitBuffer,data_length);
			USART_TransmitInterrupt(&my_buffer);

			char value[5];
			//itoa(500,&value[0],10);
			//BufferMultipleWrite(&my_buffer2,value,5);
			
			while (1)
			{
				_delay_ms(500);
				int2str4dig(convertionResult,value,1);
				//int2str4dig(wave[ii],value,1);
				BufferMultipleWrite(&my_buffer2,value,5);
				USART_TransmitInterrupt(&my_buffer2);
				ii++;
			}
			flag=0;
		}
	}
}
