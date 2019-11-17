#!/usr/bin/env python
import copy

spam = ['eggs', 'tartar', 'jar', 'taro', ['lol', 'yolo']]
# use included copy method
#spam2 = spam.copy()
# use copy module
#spam2 = copy.copy(spam)
# use deepcopy (copy inner lists)
spam2 = copy.deepcopy(spam)
spam2 += ['Lol']
print(spam)
print(spam2)
