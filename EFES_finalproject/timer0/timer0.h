/*
 * timer0.h
 *
 * Created: 12/12/2021 23:54:18
 *  Author: Marcos
 */ 


#ifndef TIMER0_H_
#define TIMER0_H_
#include <avr/io.h>
#include "../UART/uart.h"

void InitTimer0(void);
void StartTimer0(void);
void StopTimer0(void);

void timer0CTCInit(uint16_t prescaler, uint16_t match_value);



#endif /* TIMER0_H_ */