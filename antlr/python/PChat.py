#!/usr/bin/env python
#
import sys
from antlr4 import *
from PSR_ChatLexer import PSR_ChatLexer
from PSR_ChatParser import PSR_ChatParser

def main(argv):
    file_input = FileStream(argv[1])
    lexer = PSR_ChatLexer(file_input)
    stream = CommonTokenStream(lexer)
    parser = PSR_ChatParser(stream)
    tree = parser.chat()

    print(tree.toStringTree(recog=parser))

if __name__ == '__main__':
    main(sys.argv)
