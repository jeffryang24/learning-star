#!/usr/bin/env python
birthday = {'Alice': 'Mar 14', 'Bob': 'May 17', 'Tom': 'Jun 16'}
while True:
    print('Enter a name (blank to quit):')
    name = input()

    if name == '':
        break

    if name in birthday:
        print(birthday[name] + ' is the birthday for ' + name)
    else:
        print('No information for current name')
        print('Could you tell me when is his/her birthday?')
        birth = input()
        birthday[name] = birth
        print('Birthday database updated!')
