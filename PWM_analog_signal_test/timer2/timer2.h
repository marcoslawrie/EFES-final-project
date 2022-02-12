/*
 * timer2.h
 *
 * Created: 11/2/2022 18:55:58
 *  Author: Marcos
 */ 

#include <avr/io.h>      // Contains all the I/O Register Macros
#include <avr/interrupt.h>

#ifndef TIMER2_H_
#define TIMER2_H_

void timer2Init(void);
void timer2SetIntOnMatch(void);
void setTOPValue(uint8_t top);
ISR(TIMER2_COMPA_vect);

#endif /* TIMER2_H_ */