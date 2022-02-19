/*
 * buffer.h
 *
 * Created: 11/12/2021 14:36:08
 *  Author: Marcos
 */ 
#include <avr/io.h>      // Contains all the I/O Register Macros

#ifndef BUFFER_H_
#define BUFFER_H_

#define BUF_SIZE 20

//type definition of buffer structure

typedef struct{

	//Array of chars

	volatile uint8_t buffer[BUF_SIZE];

	//array element index

	volatile uint8_t index;

}u8buf;

void BufferInit(u8buf*);
uint8_t BufferWrite(u8buf *buf, uint8_t u8data);
uint8_t BufferRead(u8buf *buf, volatile uint8_t *u8data);
uint8_t BufferMultipleWrite(u8buf *buf, char charChain[], int8_t num_elements );





#endif /* BUFFER_H_ */