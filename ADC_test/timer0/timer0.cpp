/*
 * timer0.cpp
 *
 * Created: 12/12/2021 23:54:09
 *  Author: Marcos
 */ 
#include "timer0.h"
//initialize timer0
void InitTimer0(void)
{
	//Set Initial Timer value
	TCNT0=0;
	//Place TOP timer value to Output compare register
	OCR0A=255;
	//Set CTC mode
	//and make toggle PD6/OC0A pin on compare match
	//TCCR0A |=(1<<COM0A0)|(1<<WGM01);
	//Set CTC mode
	TCCR1A = 0x09; // CTC mode clock = IO clock  
}
//start timer0 with prescaller 8
void StartTimer0(void)
{
	//Set prescaller 8 and start timer
	TCCR0B |=(1<<CS02)|(1<<CS00);
}
void StopTimer(void)
{
	TCCR0B &=~(1<<CS01);
	TIMSK0 &=~(1<<OCIE0A);
}