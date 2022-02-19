/*
 * parallel_comm.cpp
 *
 * Created: 16/2/2022 14:26:06
 * Author : Marcos
 */ 

#include <avr/io.h>
#include "button/button.h"
#include "timer1/timer1.h"
#include "timer2/timer2.h"
#include "UART/uart.h"
#include "buffer/buffer.h"
#include "misc/format_converter.h"
#include "parallel_port/parallel_port.h"

volatile uint16_t counter = 0;
volatile uint16_t count_timer0 = 0;
volatile uint16_t PWM_duty_cycle = 0;
volatile uint8_t flag=0;

int main(void)
{
    USART_Init(57600);
	buttonsInit();
    while (1) 
    {
    }
}

