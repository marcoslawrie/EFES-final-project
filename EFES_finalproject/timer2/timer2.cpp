/*
 * timer2.cpp
 *
 * Created: 11/2/2022 18:56:08
 *  Author: Marcos
 */ 

#include "timer2.h"
#include "../incfile.h"
#include "../UART/uart.h"//delete
extern volatile uint8_t wave_samples[WAVE_SAMPLES_LENGTH];
static uint16_t index=0; // pointer to the different entries of the array


void timer2Init(){
	/******** Set up timer2 to call ISR ********/
	TCCR2A = 0; // No options in control register A
	TCCR2B = (1 << CS21); // Set prescaler to divide by 8
	OCR2A = 150; // Set frequency of generated wave
	
}
void disableTimer2(){
	TCCR2B = 0; // No clock source, timer 2 disable
	TCCR2A = 0; //reset timer 2 configuration
}
void fastPWMStart_T2(){
	
	// Set PB1 to be an output (Pin 11 Arduino UNO) PB3
	DDRB |= (1 << DDB3); 
	
	OCR2A = 200;// default value
	
	TCCR2B = (1 << CS20); // No prescaler
	TCCR2A = 0; //clearing previous configuration
	TCCR2A |= (1 << COM2A1); // Pin low when TCNT1=OCR2A
	TCCR2A |= (1 << WGM20) | (1 << WGM21); // fast PWM mode
	timer2disableInterrupt();
}
void CTCMOdestart_T2(){
	TCCR2A = 0;
	TCCR2A |= (1 << WGM21); // CTC mode
	
}
void timer2SetIntOnMatch(){
	TIMSK2 = (1 << OCIE2A); // Call ISR when TCNT2 = OCRA2
	sei(); // Enable interrupts to generate waveform!
}
void timer2disableInterrupt(){
	TIMSK2 &= ~(1 << OCIE2A); // Call ISR when TCNT2 = OCRA2
}
void setTOPValue(uint8_t top){
	OCR2A = top; // Set frequency of generated wave
}

ISR(TIMER2_COMPA_vect) { // Called when TCNT2 == OCR2A
	
	
	//print_string_pooling("T2\n",3);
	OCR1AL = wave_samples[index++]; // Update the PWM output
	if(index == N_SAMPLES) index = 0;
	
	
}