#!/usr/bin/env python
import sys

while True:
    print('Print "exit" to exit')
    print('=> ', end = '')
    resp = input()
    if resp == 'exit':
        sys.exit()
