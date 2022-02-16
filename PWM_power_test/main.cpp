/*
 * PWM_power_test.cpp
 *
 * Created: 12/2/2022 13:16:26
 * Author : Marcos
 */ 

#include <avr/io.h>
#include "adc/adc.h"
#include "buffer/buffer.h"
#include "UART/uart.h"
#include "timer0/timer0.h"
#include "misc/format_converter.h"
#include "button/button.h"

volatile uint16_t counter = 0;
volatile uint8_t flag=0;
volatile uint16_t count_timer0 = 0;
volatile uint16_t PWM_duty_cycle = 0;

int main(void)
{
	//Initialize USART0
	USART_Init(57600);
	buttonsInit();
   
    while (1) 
    {
		
    }
}


