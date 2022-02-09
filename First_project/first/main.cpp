/*#define F_CPU 20000000    // AVR clock frequency in Hz, used by util/delay.h
#include <avr/io.h>
#include <util/delay.h>

int main() {
	DDRD |= (1<<DDD1);          // set LED pin PD1 to output
	while (1) {
		PORTD |= (1<<PORTD1);   // drive PD1 high
		_delay_ms(500);         // delay 100 ms
		PORTD &= ~(1<<PORTD1);  // drive PD1 low
		_delay_ms(900);         // delay 900 ms
	}
}*/
/*
 Test.c
 *
 Created: 15-09-2018 07:24:45 PM
 Author : Arnab Kumar Das
 Website : www.ArnabKumarDas.com
 */ 

#define F_CPU 16000000UL // Defining the CPU Frequency for Delay Calculation in delay.h 
// Arduino UNO used a 16Mhz Crystal as Clock Source
#include <avr/io.h> // Contains all the I/O Register Macros
//#include <avr/util.h> // Generates a Blocking Delay
#include <util/delay.h>

 int main(void)
 {
     DDRB |= 1<<5; // Configuring PB5 as Output
     while (1)
     {
         PORTB |= 1<<5; // Writing HIGH to PB5
      //   _delay_ms(1000); // Delay of 1 Second
         PORTB &= ~(1<<5); // Writing LOW to PB5
        // _delay_ms(1000); // Delay of 1 Second
     } 
}
