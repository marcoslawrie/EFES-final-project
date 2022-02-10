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
volatile uint8_t flag=0;
volatile uint16_t counter = 0;
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
	USART_Init(57600);
	//initialize ports
	InitPort();
	//initialize ADC
	InitADC(&convertionResult);
	//select ADC channel
	SetADCChannel(0);
	//initialize timer0
	InitTimer0();
	//start timer0
	StartTimer0(); //NO needed
	//start conversion
	StartADC();
	//enable global interrupts
	sei();
	u8buf my_buffer2;
	char value[5];
	while(1)
	{
		

		if (flag)
		{
			
			//Printing message 
			print_string_pooling("ADC values\n",11); //Printing using polling
			
			
			//Printing result of the conversion 
			int2str4dig(convertionResult,value,1); //First we need to transform the int values to an array of chars
			BufferMultipleWrite(&my_buffer2,value,5); 
			USART_TransmitInterrupt(&my_buffer2); //Using UART with interrupts
	
			flag=0;
		}
	}
}
