#!/usr/bin/env python
import sys

def collatz(number):
    if number % 2 == 0:
        result = number // 2
        print(result)
        return result
    else:
        result = 3 * number + 1
        print(result)
        return result

try:
    print('Please enter a number!')
    num_input = int(input())
except ValueError as e:
    print('Please enter a valid int!')
    sys.exit(-1)

while num_input != 1:
    num_input = collatz(num_input)
