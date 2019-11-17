#!/usr/bin/env python
import random
secretNumber = random.randint(1, 10)

for i in range(1, 7):
    print('Try-' + str(i) + ': Guess the number')
    print('=> ', end='')
    guess=int(input())

    if guess > secretNumber:
        print('Oops.. Too high!!')
    elif guess < secretNumber:
        print('Oops.. Too low!!')
    else:
        break

if guess == secretNumber:
    print('You are the witcher!')
else:
    print('Try again later...')
