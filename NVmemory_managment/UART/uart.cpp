/*
 * UART.cpp
 *
 * Created: 11/12/2021 15:32:43
 *  Author: Marcos
 */ 
#include "uart.h"
#include "../buffer/buffer.h"

u8buf tx_buffer;
uint16_t baud_rate;

void USART_Init(uint16_t baudRate)
{
	baud_rate = baudRate; //The value of baud_rate is then use in the macro BAUD_PRESCALER
	// Set Baud Rate
	UBRR0H = BAUD_PRESCALER >> 8;
	UBRR0L = BAUD_PRESCALER;
	
	// Set Frame Format
	UCSR0C = ASYNCHRONOUS | PARITY_MODE | STOP_BIT | DATA_BIT;
	
	// Enable Receiver and Transmitter
	//UCSR0B = (1<<RXEN0) | (1<<TXEN0);
	
	//Enable only Transmitter
	UCSR0B = (1<<TXEN0);
	
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

void USART_TransmitPolling(u8buf *Buffer)
{
	
   uint8_t data;
   while(!BufferRead(Buffer,&data)){
		while (( UCSR0A & (1<<UDRE0)) == 0) {}; // Do nothing until UDR is ready
		UDR0 = data;
   }
   
}

void print_string_pooling(char string_tx [],uint16_t data_length){
	
	u8buf my_buffer;
	BufferMultipleWrite(&my_buffer,string_tx,data_length);
	USART_TransmitPolling(&my_buffer);
	
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