/*
 * parallel_port.cpp
 *
 * Created: 16/2/2022 15:17:33
 *  Author: Marcos
 */ 

#include "../UART/uart.h"
#include "parallel_port.h"


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
	
	if(!(PINB & (1 << PINB2))){ //see if the edge was a negative, and change the output value of the port and read the input port
			PINB = (1<<PINB1); //toogle value
	}
	
}