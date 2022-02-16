/*
 * PWM_analog_signal_test.cpp
 *
 * Created: 11/2/2022 01:30:03
 * Author : Marcos
 */ 

#include <stdlib.h>
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>  // Generates a Blocking Delay
#include "UART/uart.h"
#include "misc/format_converter.h"
#include "timer1/timer1.h"
#include "timer2/timer2.h"

/******** Sine wave parameters ********/
#define PI2 6.283185 // 2*PI saves calculation later
#define AMP 127 // Scaling factor for sine wave
#define OFFSET 128 // Offset shifts wave to all >0 values

/******** Lookup table ********/
#define LENGTH 256 // Length of the wave lookup table
uint8_t wave[LENGTH]; // Storage for waveform


int main(void)
{
	
	/* Populate the waveform table with a sine wave */
	for (int i=0; i<LENGTH; i++) { // Step across wave table
		float v = (AMP*(0.85*sin((PI2/LENGTH)*i)+0.15*sin((15*PI2/LENGTH)*i))); // Compute value
		wave[i] = int(v+OFFSET); // Store value as integer
	}
	
	
	
	fastPWMStart_T1();
	timer2Init();
	timer2SetIntOnMatch();
	


	
    while (1) 
    {
		
    }
}



