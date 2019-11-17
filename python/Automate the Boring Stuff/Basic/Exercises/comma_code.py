#!/usr/bin/env python
def comma_code(items):
    for i in range(len(items)):
        if i == len(items) - 1:
            print('and ' + items[i])
        else:
            print(items[i], end=', ')

spam = ['apples', 'bananas', 'tofu', 'cats']
comma_code(spam)
