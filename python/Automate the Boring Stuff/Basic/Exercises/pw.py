#!/usr/bin/env python
# pw.py - insecure password manager
import sys, pyperclip

PASSWORDS = {'email': 'F7minlBDDuvMJuxESSKHFhTxFtjVB6',
             'blog': 'VmALvQyKAxiVH5G8v01if1MLZF3sdt',
             'luggage': '12345'}

if (len(sys.argv) < 2):
    print('Usage: python pw.py [account] - copy account password')
    exit()

account = sys.argv[1]

if account in PASSWORDS:
    pyperclip.copy(PASSWORDS[account])
    print('Password has been copied to the clipboard.')
else:
    print('There is no account named ' + account)
