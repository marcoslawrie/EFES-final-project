/*
 * button.cpp
 *
 * Created: 15/2/2022 17:19:18
 *  Author: Marcos
 */ 

#include "button.h"
#include "../parallel_port/parallel_port.h"
#include "../adc/adc.h"
#include "../timer0/timer0.h"
#include "../misc/signal_generation.h"
#include "../EEPROM/eeprom.h"

extern uint16_t count_timer0;
extern volatile uint16_t PWM_duty_cycle;
extern uint8_t wave_samples[WAVE_SAMPLES_LENGTH];
volatile static uint8_t data_in_memory = 0;
volatile static uint8_t wave_selector = 0;

void buttonsInit(void){
		
		///////////////////////////// INT 0 initialization ///////////////////////////////////////////
		//print_string_pooling("start int0\n",11); //Printing using polling
		DDRD  &= ~( 1UL << DDD2   );     /// Clear the PD2 pin and set PD2 (PCINT0 pin) now as input
		PORTD |=  ( 1UL << PORTD2);     /// Set PIN PD2 as INPUT with pull-up enabled

		EICRA |=  ( 1UL << ISC01 );     /// set INT0 to trigger on Falling edge
		EIFR |= (1UL <<INTF0);
		EIMSK |=  ( 1UL << INT0  );     /// Turns on INT0
		///////////////////////////// INT 1 initialization ///////////////////////////////////////////
		//print_string_pooling("start int1\n",11); //Printing using polling
		DDRD  &= ~( 1UL << DDD3   );     /// Clear the PD3 pin and set PD3 (PCINT1 pin) now as input
		PORTD |=  ( 1UL << PORTD3);     /// Set PIN PD3 as INPUT with pull-up enabled

		EICRA |=  ( 1UL << ISC11 );     /// set INT1 to trigger on Falling edge
		EIFR |= (1UL <<INTF1);
		EIMSK |=  ( 1UL << INT1  );     /// Turns on INT1
		
		//////////////////////////// Change interrupt initialization ///////////////////////////////
		DDRB &= ~(1UL << DDB0); //PB0 (PCINT0) in now an input
		PORTB |= (1 << PORTB0); // Pull-up enabled in PB0
		PCICR |= (1 << PCIE0);     // set PCIE0 to enable pin change interrupt 1
		PCMSK0 |= (1 << PCINT0);   // set PCINT0 to trigger an interrupt on state change
		PCIFR |= (1<<PCIF0); //clearing flag
		sei();                          /// turn on interrupts
		print_string_pooling("endd conf\n",10); //Printing using polling
}


ISR (PCINT0_vect){ //Interrupt using PIN 8 (PB0). It shows wave form stored in the memory using PWM
	
	//print_string_pooling("Change ISR\n",11); DEBUG
	if( count_timer0 == 0){ //count_timer0>55 ||
	//	print_string_pooling("true button press\n",18); DEBUG
		count_timer0++;
		timer0CTCInit(1024, 250);
		DisableADC();
		if(!wave_selector){
			EEPROM_read_batch(TX_SIGNAL_START_ADDRESS, wave_samples,N_SAMPLES);
			wave_selector = 1;
		}
		else{
			EEPROM_read_batch(RX_SIGNAL_START_ADDRESS, wave_samples,N_SAMPLES);
			wave_selector = 0;
		}
		/*for (int i=0; i<N_SAMPLES; i++) { // Step across wave table
			float v = (AMP*(0.85*sin((PI2/N_SAMPLES)*i)+0.15*sin((KFO*PI2/N_SAMPLES)*i))); // Compute value
			wave_samples[i] = uint8_t(v+OFFSET); // Store value as integer
		}*/
		//Start PWM to show signal
		fastPWMStart_T1();
		timer2Init();
		timer2SetIntOnMatch();
		
	}
	else{
		//print_string_pooling("Bounce\n",7); DEBUG
		//char value[5]; DEBUG
		//int2str4dig(count_timer0,value,1); //DEBUG
		//print_string_pooling(value,5); //DEBUG
		
	}                      
}

ISR( INT1_vect ){ //Interrupt using PIN 3 (PD3). It starts filtering.
	print_string_pooling("INT1 ISR\n",9);//DEBUG
	if( count_timer0 == 0){ //count_timer0>55 ||
		count_timer0++;
		timer0CTCInit(1024, 250);
		
		if(!data_in_memory) {
			print_string_pooling("Generating data\n",16);
			//GENERATE DATA
			generate_sine();
			//disable interrupts while data is being saved in memory
			cli();
			//save it in memory
			EEPROM_update_batch(TX_SIGNAL_START_ADDRESS, &wave_samples[HALF_N_TAPS],N_SAMPLES);
			data_in_memory = 1;
		}
		else{
			print_string_pooling("Data already generated, reading from memory\n",44);
			//disable interrupts while data is being read from the memory
			cli();
			EEPROM_read_batch(TX_SIGNAL_START_ADDRESS, &wave_samples[HALF_N_TAPS],N_SAMPLES);
			//Fill the N_TAPS/2 values at the beginning and at the end of the array for the circular convolution
			for (int i =0 ; i<HALF_N_TAPS ;i++){
				wave_samples[i] = wave_samples[i+N_SAMPLES];
				wave_samples[i+N_SAMPLES+HALF_N_TAPS] = wave_samples[i+HALF_N_TAPS];
			}
		}
		
		sei();
		
		//Initialize port and filter data		
		DisableADC();
		parallelPortInit();
		portClockInit();
		//Save filtered data in memory
		EEPROM_update_batch(RX_SIGNAL_START_ADDRESS,wave_samples,N_SAMPLES);
		
		
	}
	else{
		//print_string_pooling("Bounce\n",7); DEBUG
		//char value[5]; DEBUG
		//int2str4dig(count_timer0,value,1); DEBUG
		//print_string_pooling(value,5); DEBUG
		
	}                      // again
}

ISR ( INT0_vect ){ //Interrupt using PIN 2 (PD2). It turn on the PWM for power management and also read the analog value that sets the duty cycle.
	
	//print_string_pooling("INT0 ISR\n",9); DEBUG
	if( count_timer0 == 0){ //count_timer0>55 ||
		//print_string_pooling("true button press\n",18); DEBUG
		count_timer0++;
		timer0CTCInit(1024, 155);
		//SINGLE READ OF ADC and INIT POWER PWM
		uint16_t temp;
		InitADCSingleReading(&temp);

		SetADCChannel(0);
		StartADC();
		while(ADCSRA & (1<<ADSC)); //waiting for the conversion to finish
		//print_string_pooling("conversion done\n",16); DEBUG
		PWM_duty_cycle = temp;
		//u8buf my_buffer2; DEBUG
		//char value[5]; DEBUG
		//Printing result of the conversion
		//int2str4dig(PWM_duty_cycle,value,1); DEBUG
		//BufferMultipleWrite(&my_buffer2,value,5); DEBUG
		//USART_TransmitInterrupt(&my_buffer2); //Using UART with interrupts
		
		if(!((TCCR2A & (1 << WGM20))&& (TCCR2A & (1 << WGM21)))){ //see if PWM of timer 2 is already working or not
			fastPWMStart_T2(); //PWM was not set up
			//print_string_pooling("START T2\n",9);	 DEBUG
		}
		setTOPValue(PWM_duty_cycle);
		
	}
	else{ //Do nothing, the interrupt was generated by a bounce
		/*print_string_pooling("Bounce\n",7); DEBUG
		char value[5];
		int2str4dig(count_timer0,value,1); //First we need to transform the int values to an array of chars
		print_string_pooling(value,5);*/
		
	}
}
