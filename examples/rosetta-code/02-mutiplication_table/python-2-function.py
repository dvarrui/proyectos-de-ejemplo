#!/usr/bin/env python3

def show_table(number):
  for i in range(1,11):
    print(f' {i} * {number} = {str(i*number)} ')

# step 1: input number
number = int(input("Write a number: "))

# step 1: show table
show_table(number)
