#!/usr/bin/env python
def spam(dividedBy):
    return 100 / dividedBy

try:
    print(spam(20))
    print(spam(30))
    print(spam(0))
except ZeroDivisionError as e:
    print('Oops... Don\'t do that!')
