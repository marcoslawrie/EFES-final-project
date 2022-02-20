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

extern uint16_t count_timer0;
extern volatile uint16_t PWM_duty_cycle;

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
		PCIFR |= (1<<PCIF0); //clearin flag
		sei();                          /// turn on interrupts
		print_string_pooling("endd conf\n",10); //Printing using polling
}


ISR (PCINT0_vect){
	
	//print_string_pooling("Change ISR\n",11); DEBUG
	if( count_timer0 == 0){ //count_timer0>55 ||
	//	print_string_pooling("true button press\n",18); DEBUG
		count_timer0++;
		timer0CTCInit(1024, 250);
		
		
		
	}
	else{
		//print_string_pooling("Bounce\n",7); DEBUG
		//char value[5]; DEBUG
		//int2str4dig(count_timer0,value,1); //DEBUG
		//print_string_pooling(value,5); //DEBUG
		
	}                      
}

ISR( INT1_vect ){ //start filtering in this interrupt
	print_string_pooling("INT1 ISR\n",9);//DEBUG
	if( count_timer0 == 0){ //count_timer0>55 ||
		print_string_pooling("aaa\n",4);// DEBUG
		count_timer0++;
		timer0CTCInit(1024, 250);
		//GENERATE DATA, and save it in memory
		
		//Initialize port and filter data		
		DisableADC();
		parallelPortInit();
		portClockInit();
		//Save data in memory
		
		
	}
	else{
		//print_string_pooling("Bounce\n",7); DEBUG
		//char value[5]; DEBUG
		//int2str4dig(count_timer0,value,1); DEBUG
		//print_string_pooling(value,5); DEBUG
		
	}                      // again
}

ISR ( INT0_vect ){
	
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
		
		if(!((TCCR2A & (1 << WGM20))&& (TCCR2A & (1 << WGM21)))){ //see if PWM of timer 2 is already working or n
			fastPWMStart_T2(); //PWM was not set up
			//print_string_pooling("START T2\n",9);	 DEBUG
		}
		setTOPValue(PWM_duty_cycle);
		
	}
	else{
		/*print_string_pooling("Bounce\n",7); DEBUG
		char value[5];
		int2str4dig(count_timer0,value,1); //First we need to transform the int values to an array of chars
		print_string_pooling(value,5);*/
		
	}
}
