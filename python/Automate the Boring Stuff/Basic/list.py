#!/usr/bin/env python
catNames = []
while True:
    print('Please enter the name of the cat ' + str(len(catNames) + 1))
    name = input()
    if name == '':
        break

    catNames += [name]

print('The cat names are:')
for i in catNames:
    print('- ' + i)
