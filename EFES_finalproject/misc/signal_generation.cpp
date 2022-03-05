/*
 * signal_generation.cpp
 *
 * Created: 21/2/2022 21:51:25
 *  Author: Marcos
 */ 

#include "signal_generation.h"
extern uint8_t wave_samples[WAVE_SAMPLES_LENGTH];

void generate_sine(){
	
		//creating values of the output signal
		for (int i=0; i<N_SAMPLES; i++) { // Step across wave table
			float v = (AMP*(0.6*sin((PI2/N_SAMPLES)*i)+0.4*sin((KFO*PI2/N_SAMPLES)*i))); // Compute value
			wave_samples[i+HALF_N_TAPS] = uint8_t(v+OFFSET); // Store value as integer
		}
		//Fill the N_TAPS/2 values at the beginning and at the end of the array for the circular convolution
		for (int i =0 ; i<HALF_N_TAPS ;i++){
			wave_samples[i] = wave_samples[i+N_SAMPLES];
			wave_samples[i+N_SAMPLES+HALF_N_TAPS] = wave_samples[i+HALF_N_TAPS];
		}
	
}
