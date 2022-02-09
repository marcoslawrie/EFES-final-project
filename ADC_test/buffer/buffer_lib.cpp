/*
 * buffer_lib.cpp
 *
 * Created: 11/12/2021 14:39:29
 *  Author: Marcos
 */ 
#include "buffer.h"

//initialize buffer

void BufferInit(u8buf *buf)

{

	//set index to start of buffer

	buf->index=0;

}

//write to buffer routine

uint8_t BufferWrite(u8buf *buf, uint8_t u8data)
	
{

	if (buf->index<BUF_SIZE)

	{

		buf->buffer[buf->index] = u8data;

		//increment buffer index

		buf->index++;

		return 0;

	}

	else return 1;

}
//Multiple writing routine
uint8_t BufferMultipleWrite(u8buf *buf, char charChain[], int8_t num_elements ){
	BufferInit(buf);
	while(num_elements>-1){
		
		if(BufferWrite(buf,charChain[num_elements-1])){
			
			return 1;
			
		}
		num_elements--;
	}
	
	return 0;
	
}

uint8_t BufferRead(u8buf *buf, volatile uint8_t *u8data)

{

	if(buf->index>0)

	{

		buf->index--;

		*u8data=buf->buffer[buf->index];

		return 0;

	}

	else return 1;

}