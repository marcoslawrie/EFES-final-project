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
	//The value for OCRn has to be calculated as clk_speed/prescalerValue * desired time in seconds - 1
	OCR0A=155; //155 value for 10ms
	//Set CTC mode
	//and make toggle PD6/OC0A pin on compare match
	TCCR0A |=(1<<COM0A0)|(1<<WGM01);
}
//start timer0 with prescaller 8
void StartTimer0(void)
{

	//Set prescaller 1024 and start timer
	TCCR0B |=(1<<CS00) | (1<<CS02);
}
void StopTimer(void)
{
	TCCR0B &=~(1<<CS01);
	TIMSK0 &=~(1<<OCIE0A);
}