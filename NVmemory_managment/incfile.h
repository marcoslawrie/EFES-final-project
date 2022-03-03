/*
 * IncFile.h
 *
 * Created: 21/2/2022 18:09:22
 *  Author: Marcos
 */ 


#ifndef INCFILE_H_
#define INCFILE_H_

#include <stdlib.h>
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>


/******** EEPROM defines ******/
#define EEPROM_LENGTH 1024
#define TX_SIGNAL_START_ADDRESS 0
#define RX_SIGNAL_START_ADDRESS (TX_SIGNAL_START_ADDRESS+N_SAMPLES)

/******** Signal filter defines *******/
#define N_SAMPLES 500
#define WAVE_SAMPLES_LENGTH (N_SAMPLES + N_TAPS - 1)
#define N_TAPS 9
#define HALF_N_TAPS 4
#define PIPELINE_DEPTH 6


/******** Sine wave parameters ********/
#define PI2 6.283185 // 2*PI saves calculation later
#define AMP 31 // Scaling factor for sine wave (we use 6 bits to represent the sine wave)
#define OFFSET 32 // Offset shifts wave to all >0 values
#define KFO 80






#endif /* INCFILE_H_ */