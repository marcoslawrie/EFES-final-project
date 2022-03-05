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
ISR(ADC_vect)
{
	//see if the ADC auto trigger is enable. if not, it is a single reading
	if(ADCSRA & (1<<ADATE)){
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
	else{
		*adcResult = ADCH;
		print_string_pooling("conversion done\n",16);
		DisableADC();
	}
	

	

}