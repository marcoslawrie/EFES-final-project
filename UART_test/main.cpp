#define F_CPU 16000000UL // Defining the CPU Frequency

#include <avr/io.h>      // Contains all the I/O Register Macros
#include <util/delay.h>  // Generates a Blocking Delay
#include <avr/interrupt.h> // Contains all interrupt vectors

#include "Buffer/buffer.h"
#include "UART/uart.h"

#define USART_BAUDRATE 9600 // Desired Baud Rate
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


volatile int8_t charIndex = 8;
int data_length = 8;
u8buf my_buffer;
u8buf my_buffer3;


int main()
{
	unsigned char USART_TransmitBuffer[8] ="HDPPPP\n"; // Global Buffer
	DDRB |= 1 << 5; // Configuring PB5 / D13 as Output
	
	USART_Init();
	
	BufferMultipleWrite(&my_buffer3,USART_TransmitBuffer,data_length);
	
	
	USART_TransmitInterrupt(&my_buffer3);

	while (1)
	{
					PORTB |= 1<<5; // Writing HIGH to glow LED
					_delay_ms(500);
					PORTB &= ~(1<<5); // Writing LOW
					_delay_ms(500);

	}
	
	return 0;
}
