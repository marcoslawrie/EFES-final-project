
/*
 * button.h
 *
 * Created: 15/2/2022 17:18:55
 *  Author: Marcos
 */ 
#include <avr/io.h>
#include "../buffer/buffer.h"
#include "../UART/uart.h"
#include "../timer0/timer0.h"
#include "../misc/format_converter.h"
#include "../adc/adc.h"
#include "../timer2/timer2.h"

void buttonsInit(void);