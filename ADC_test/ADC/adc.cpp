/*
 * adc.cpp
 *
 * Created: 12/12/2021 23:28:39
 *  Author: Marcos
 */ 
#include "adc.h"

uint16_t *adcResult;
extern volatile uint8_t flag;
extern volatile uint16_t counter;

void InitADC(uint16_t *presult)
{
 // Select Vref=AVcc
 //and set left adjust result
 ADMUX |= (1<<REFS0)|(1<<ADLAR);
 //set prescaller to 32
 //enable autotriggering
 //enable ADC interupt
 //and enable ADC
 ADCSRA |= (1<<ADPS2)|(1<<ADPS0)|(1<<ADATE)|(1<<ADIE)|(1<<ADEN);
 //set ADC trigger source - Timer0 compare match A
 ADCSRB |= (1<<ADTS1)|(1<<ADTS0);
	adcResult = presult;
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
ISR(ADC_vect)
{

	//clear timer compare match flag
	TIFR0=(1<<OCF0A);
	counter++;
	//toggle pin PD2 to track the end of ADC conversion
	//PIND = (1<<PD2);
	if(counter == 100){
				
		*adcResult = ADCH;
		flag = 1;
		counter = 0;	
	}

	

}