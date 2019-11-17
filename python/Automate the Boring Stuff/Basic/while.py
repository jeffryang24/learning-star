#!/usr/bin/env python
while True:
    print('Who are you?')
    name = input()

    if name != 'Joe':
        continue

    print('Hello, X. What is your password? (it\'s a fish.)')
    password = input()

    if password == 'swordfish':
        break

print('Access granted!')
