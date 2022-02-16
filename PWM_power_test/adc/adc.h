/*
 * adc.h
 *
 * Created: 12/12/2021 23:28:28
 *  Author: Marcos
 */ 


#ifndef ADC_H_
#define ADC_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include "../UART/uart.h"

void InitADC(uint16_t *presult);
void InitADCSingleReading(uint16_t *ConversionResult);
void SetADCChannel(uint8_t ADCchannel);
void StartADC(void);
void DisableADC(void);

ISR(ADC_vect);



#endif /* ADC_H_ */