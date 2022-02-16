/*
 * timer0.cpp
 *
 * Created: 12/12/2021 23:54:09
 *  Author: Marcos
 */ 
#include "timer0.h"
#include <avr/interrupt.h>

extern uint16_t count_timer0;
//initialize timer0
void timer0CTCInit(uint16_t prescaler, uint16_t match_value){
	
	//print_string_pooling("Timer0 start conf\n",18); DEBUG LINE
	TCCR0B &= 0xF0; //clearing previous prescaler configuration and clearing WGM02
	
	switch(prescaler){
		case 1024:
			
			TCCR0B |=  (1<<CS00) | (1<<CS02);
			break;
		case 256:
			TCCR0B |=  (1<<CS02);
			break;
		case 64:
			TCCR0B |=  (1<<CS01) | (1<<CS00);
			break;
		case 8:
			TCCR0B |=  (1<<CS01);
			break;
		default:
			TCCR0B |=  (1<<CS00); //default prescaler = 1.
			break;
	}
	
	
	TCNT0=0;
	//The value for OCRn has to be calculated as clk_speed/prescalerValue * desired time in seconds - 1
	OCR0A=match_value; //155 value for 10ms
	//Set CTC mode
	TCCR0A |=(1<<WGM01);
	//Enabling interrupt when match with OCR0A
	TIMSK0 = 0;
	TIMSK0 = 1<<OCIE0A;
	
	//enabling global interrupts
	sei();
	
	//print_string_pooling("Timer0 end conf\n",15); DEBUG LINE
	
}

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
	TCCR0B &= 0xF0; //no clock source, timer freezed
	TIMSK0 &=~(1<<OCIE0A);
	//disable timer 0 interrupts
	TIMSK0 = 0;

}
ISR(TIMER0_COMPA_vect) {
	
	count_timer0++;
	if(count_timer0>20){
		//print_string_pooling("restart counter\n",16); DEBUG LINE
		count_timer0 = 0;
		StopTimer();
	}
}
