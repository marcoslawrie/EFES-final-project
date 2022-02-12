/*
 * timer2.cpp
 *
 * Created: 11/2/2022 18:56:08
 *  Author: Marcos
 */ 

#include "timer2.h"
extern uint8_t wave[];


void timer2Init(){
	/******** Set up timer2 to call ISR ********/
	TCCR2A = 0; // No options in control register A
	TCCR2B = (1 << CS21); // Set prescaler to divide by 8
	OCR2A = 32; // Set frequency of generated wave
	
}

void timer2SetIntOnMatch(){
	TIMSK2 = (1 << OCIE2A); // Call ISR when TCNT2 = OCRA2
	sei(); // Enable interrupts to generate waveform!
}
void setTOPValue(uint8_t top){
	OCR2A = top; // Set frequency of generated wave
}

ISR(TIMER2_COMPA_vect) { // Called when TCNT2 == OCR2A
	static uint8_t index=0; // Points to each table entry
	OCR1AL = wave[index++]; // Update the PWM output
	asm("NOP;NOP"); // Fine tuning
	TCNT2 = 6; // Timing to compensate for ISR run time
}