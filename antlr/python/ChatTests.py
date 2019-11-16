#!/usr/bin/env python
from antlr4 import *
from PSR_ChatLexer import PSR_ChatLexer
from PSR_ChatParser import PSR_ChatParser
from HtmlChatListener import HtmlChatListener
from ChatErrorListener import ChatErrorListener
import unittest
import io

class TestChatParser(unittest.TestCase):

    def setup(self, text):
        lexer = PSR_ChatLexer(InputStream(text))
        stream = CommonTokenStream(lexer)
        parser = PSR_ChatParser(stream)

        self.output = io.StringIO()
        self.error = io.StringIO()

        parser.removeErrorListeners()
        errorListener = ChatErrorListener(self.error)
        parser.addErrorListener(errorListener)

        self.errorListener = errorListener

        return parser

    def test_valid_name(self):
        parser = self.setup("John ")
        tree = parser.name()

        htmlChat = HtmlChatListener(self.output)
        walker = ParseTreeWalker()
        walker.walk(htmlChat, tree)

        # let's check that there aren't any symbols in errorListener
        self.assertEqual(len(self.errorListener.symbol), 0)

    def test_invalid_name(self):
        parser = self.setup("Joh-")
        tree = parser.name()

        HtmlChat = HtmlChatListener(self.output)
        walker = ParseTreeWalker()
        walker.walk(HtmlChat, tree)

        self.assertEqual(self.errorListener.symbol, '-')

if __name__ == '__main__':
    unittest.main()
