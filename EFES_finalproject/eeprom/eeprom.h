/*
 * EEPROM.h
 *
 * Created: 19/2/2022 17:45:49
 *  Author: Marcos
 */ 

#include <stdlib.h>
#include <stdio.h>
#include <avr/io.h>

#ifndef EEPROM_H_
#define EEPROM_H_

#define EEPROM_MAX_ADDRESS 1023

enum{
	EEPROM_OK,
	EEPROM_WRITE_FAIL,
	EEPROM_INVALID_ADDR
};

uint8_t EEPROM_read(uint16_t uiAddress, uint8_t *data);
uint8_t EEPROM_write(uint16_t uiAddress, uint8_t ucData);
uint8_t EEPROM_update(uint16_t uiAddress, uint8_t ucData);
uint8_t EEPROM_update_batch(uint16_t uiAddress, void *data,uint16_t len);
uint8_t EEPROM_read_batch(uint16_t uiAddress, void *data,uint16_t len);



#endif /* EEPROM_H_ */