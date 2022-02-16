/*
 * timer1.cpp
 *
 * Created: 11/2/2022 18:50:11
 *  Author: Marcos
 */ 
#include "timer1.h"

/****Set timer1 for 8-bit fast PWM output ****/
void fastPWMStart_T1(void){
	
	// Set PB1 to be an output (Pin9 Arduino UNO)
	DDRB |= (1 << DDB1);
	
	TCCR1B = (1 << CS10); // Set prescaler to full 16MHz
	TCCR1A |= (1 << COM1A1); // Pin low when TCNT1=OCR1A
	TCCR1A |= (1 << WGM10); // Use 8-bit fast PWM mode
	TCCR1B |= (1 << WGM12);
}