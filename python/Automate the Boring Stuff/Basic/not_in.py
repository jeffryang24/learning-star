#!/usr/bin/env python
pets_name = ['An', 'Hera', 'Tol', 'Zika']
print('Input pets name')
name = input()
if name not in pets_name:
    print('No name matches "' + name + '" from our lists.')
else:
    print('Here, you are.')
