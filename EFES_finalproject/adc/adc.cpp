/*
 * adc.cpp
 *
 * Created: 12/12/2021 23:28:39
 *  Author: Marcos
 */ 
#include "adc.h"

uint16_t *adcResult;


void InitADC(uint16_t *ConversionResult)
{
	// Select Vref=AVcc
	//and set left adjust result
	ADMUX |= (1<<REFS0)|(1<<ADLAR);
	//set prescaller to 32 (ADPSx bits)
	//enable autotriggering (ADATE bit)
	//enable ADC interupt (ADIE bit)
	//and enable ADC (ADEN bit)
	ADCSRA |= (1<<ADPS2)|(1<<ADPS0)|(1<<ADATE)|(1<<ADIE)|(1<<ADEN);
	//set ADC trigger source - Timer0 compare match A
	ADCSRB |= (1<<ADTS1)|(1<<ADTS0);
	adcResult = ConversionResult;
}
void InitADCSingleReading(uint16_t *ConversionResult){
	// Select Vref=AVcc
	//and set left adjust result
	ADMUX &= 0x0F; //clearing upper nibble of the register to write the new configuration
	ADMUX |= (1<<REFS0)|(1<<ADLAR);
	//set prescaller to 32 (ADPSx bits)
	//enable ADC interupt (ADIE bit)
	//and enable ADC (ADEN bit)
	ADCSRA = (1<<ADPS2)|(1<<ADPS0)|(1<<ADIE)|(1<<ADEN);
	adcResult = ConversionResult;
}


void SetADCChannel(uint8_t ADCchannel)
{
	//select ADC channel with safety mask
	ADMUX = (ADMUX & 0xF0) | (ADCchannel & 0x0F);
}
void StartADC(void)
{
	ADCSRA |= (1<<ADSC);
}
//disable ADC
void DisableADC(void)
{
	ADCSRA &= ~((1<<ADEN)|(1<<ADIE));
}
//ADC conversion complete ISR
ISR(ADC_vect){
		
		*adcResult = ADCH;
		DisableADC();
}