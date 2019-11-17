#!/usr/bin/env python
import random
def getAnswer(number):
    if number == 1:
        return 'Hmm.. Good!!'
    elif number == 3:
        return 'Not good!'
    else:
        return 'Hmm.. Dunno!'

ans = getAnswer(random.randint(0, 3))
print(ans)
