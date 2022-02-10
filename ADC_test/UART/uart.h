/*
 * UART.h
 *
 * Created: 11/12/2021 15:32:17
 *  Author: Marcos
 */ 
#ifndef UART_H_
#define UART_H_
#endif /* UART_H_ */
#include <avr/interrupt.h> // Contains all interrupt vectors
#include <avr/io.h>      // Contains all the I/O Register Macros
#include "../buffer/buffer.h"
#define F_CPU 16000000UL // Defining the CPU Frequency

#define USART_BAUDRATE baud_rate // Desired Baud Rate
#define BAUD_PRESCALER (((F_CPU / (USART_BAUDRATE * 16UL))) - 1)

#define ASYNCHRONOUS (0<<UMSEL00) // USART Mode Selection

#define DISABLED    (0<<UPM00)
#define EVEN_PARITY (2<<UPM00)
#define ODD_PARITY  (3<<UPM00)
#define PARITY_MODE  DISABLED // USART Parity Bit Selection

#define ONE_BIT (0<<USBS0)
#define TWO_BIT (1<<USBS0)
#define STOP_BIT ONE_BIT      // USART Stop Bit Selection

#define FIVE_BIT  (0<<UCSZ00)
#define SIX_BIT   (1<<UCSZ00)
#define SEVEN_BIT (2<<UCSZ00)
#define EIGHT_BIT (3<<UCSZ00)
#define DATA_BIT   EIGHT_BIT  // USART Data Bit Selection

#define RX_COMPLETE_INTERRUPT         (1<<RXCIE0)
#define DATA_REGISTER_EMPTY_INTERRUPT (1<<UDRIE0)



void USART_Init(uint16_t baudRate);
void USART_TransmitInterrupt(u8buf *);
void USART_TransmitPolling(u8buf *Buffer);
void print_string_pooling(char string_tx [],uint16_t data_length);

ISR(USART_UDRE_vect);



