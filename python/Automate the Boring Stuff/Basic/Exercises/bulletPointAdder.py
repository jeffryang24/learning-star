#!/usr/bin/env python
# Add bullet to each line of the text from clipboard
import pyperclip

text = pyperclip.paste()
lines = text.split('\n')

for i in range(len(lines)):
    lines[i] = '* ' + lines[i]

text = '\n'.join(lines)

pyperclip.copy(text)

print('Your text has been copied to the clipboard.')
