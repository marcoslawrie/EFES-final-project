/*
 * timer2.cpp
 *
 * Created: 11/2/2022 18:56:08
 *  Author: Marcos
 */ 

#include "timer2.h"
#include "../incfile.h"
extern volatile uint8_t wave_samples[WAVE_SAMPLES_LENGTH];
static uint16_t index=0; // pointer to the different entries of the array


void timer2Init(){
	/******** Set up timer2 to call ISR ********/
	TCCR2A = 0; // No options in control register A
	TCCR2B = (1 << CS21); // Set prescaler to divide by 8
	//OCR2A = 32; // Set frequency of generated wave
	OCR2A = 250; // Set frequency of generated wave
}
void fastPWMStart_T2(){
	
	// Set PB1 to be an output (Pin 11 Arduino UNO) PB3
	DDRB |= (1 << DDB3); 
	
	OCR2A = 32;//set duty cycle 50%, default value
	//
	TCCR2B = (1 << CS20); // No prescaler
	TCCR2A |= (1 << COM2A1); // Pin low when TCNT1=OCR2A
	TCCR2A |= (1 << WGM20) | (1 << WGM21); // fast PWM mode
	//TCCR2B |= (1 << WGM22); //waveform generation mode
}
void timer2SetIntOnMatch(){
	TIMSK2 = (1 << OCIE2A); // Call ISR when TCNT2 = OCRA2
	sei(); // Enable interrupts to generate waveform!
}
void setTOPValue(uint8_t top){
	OCR2A = top; // Set frequency of generated wave
}

ISR(TIMER2_COMPA_vect) { // Called when TCNT2 == OCR2A
	
	
	
	OCR1AL = wave_samples[index++]; // Update the PWM output
	TCNT2 = 6; // Timing to compensate for ISR run time
	if(index == N_SAMPLES) index = 0;
	
/*	static uint8_t index=0; // Points to each table entry
	OCR1AL = wave[index++]; // Update the PWM output
	asm("NOP;NOP"); // Fine tuning*/
	
}