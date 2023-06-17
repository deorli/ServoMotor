/**
  ******************************************************************************
  * @file           : main.c
  * @author         : Mateuasdasdsz Bator
  * @brief          : This file contains the definition for
  *                   the main.c file.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) Bator Mateusz 
  * email: deorli@o2.pl
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  *
  ******************************************************************************
  */

#include "stm32f303x8.h"
#include "main.h"
#include "system_clock.h"

void delay_ns(uint16_t time_ns){
    TIM1->CNT = 0;
    while(TIM1->CNT < time_ns);
}

void delay(uint16_t time_ms){
    for(int16_t i=0; i<time_ms; i++)
    {
      delay_ns(1000);
    }
}

int main(void)
{
  SystemInit();
  
  // GIOP
  RCC->AHBENR |= (1<<18);

  GPIOB->MODER = (1<<6) | (0<<7);
  GPIOB->OTYPER &= ~(1<<3);
  //GPIOB->OSPEEDR |= (1<<6);

  GPIOA->PUPDR &= ~((1<<6) | (1<<7));

  GPIOB->BSRR |= (1<<3);

  //TIMER 1
  RCC->APB2ENR |= (1 << 11);

  TIM1->PSC = 8 - 1;
  TIM1->ARR = 0xffff;

  TIM1->CR1 = (1 << 0);
  while(!(TIM1->SR) & (1<<0));

  while (1)
  {
    GPIOB->BSRR |= (1<<3);
    delay(1000);
    GPIOB->BSRR |= (1<< 19);
    delay(1000);
  }
}
