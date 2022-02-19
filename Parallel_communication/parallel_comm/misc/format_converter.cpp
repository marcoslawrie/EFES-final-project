/*
 * format_converter.cpp
 *
 * Created: 12/12/2021 22:55:37
 *  Author: Marcos
 */ 

#include "format_converter.h"

void int2str4dig(int valueToConvert,char string[],uint8_t addNewLine){
	itoa(valueToConvert,string,10);
	if(valueToConvert<10){
		string[3] = string[0];
		string[0] = '0';
		string[1] = '0';
		string[2] = '0';
	}
	else if(valueToConvert<100){
		string[2] = string[0];
		string[3] = string[1];
		string[0] = '0';
		string[1] = '0';
	
	}
	else if(valueToConvert<1000){
		string[3] = string[2];
		string[2] = string[1];
		string[1] = string[0];
		string[0] = '0';
	}
	if(addNewLine){string[4] = '\n';}
	
	}
				