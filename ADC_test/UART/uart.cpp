/*
 * UART.cpp
 *
 * Created: 11/12/2021 15:32:43
 *  Author: Marcos
 */ 
#include "uart.h"
#include "../buffer/buffer.h"

u8buf tx_buffer;

void USART_Init()
{

	// Set Baud Rate
	UBRR0H = BAUD_PRESCALER >> 8;
	UBRR0L = BAUD_PRESCALER;
	
	// Set Frame Format
	UCSR0C = ASYNCHRONOUS | PARITY_MODE | STOP_BIT | DATA_BIT;
	
	// Enable Receiver and Transmitter
	UCSR0B = (1<<RXEN0) | (1<<TXEN0);
	
	//Enable Global Interrupts
	sei();
}

void USART_TransmitInterrupt(u8buf *Buffer)
{
	//We need to check if there is another transmission in progress
	while(UCSR0B & DATA_REGISTER_EMPTY_INTERRUPT){}
	tx_buffer = *Buffer;
	UCSR0B |= DATA_REGISTER_EMPTY_INTERRUPT; // Enables the Interrupt
	//Enable Global Interrupts
	sei();
}


ISR(USART_UDRE_vect)
{

		uint8_t data;
		if(!BufferRead(&tx_buffer,&data)){
			UDR0 = data;
		}
		else{ 
			//all data has been transmitted, disable the interrupt
			UCSR0B &= ~DATA_REGISTER_EMPTY_INTERRUPT; 
		}
	   
}