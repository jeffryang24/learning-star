const http = require('http');
const antlr4 = require('antlr4/index');
const ChatLexer = require('./PSR_ChatLexer');
const ChatParser = require('./PSR_ChatParser');
const HtmlChatListener = require('./HtmlChatListener').HtmlChatListener;

http.createServer((req, resp) => {
  resp.writeHead(200, {
    'Content-Type': 'text/html',
  });

  resp.write('<html><head><meta charset="UTF-8" /></head><body>');

  var input = "john SHOUTS: hello @michael /pink/this will work/ :-) \n";
  var chars = new antlr4.InputStream(input);
  var lexer = new ChatLexer.PSR_ChatLexer(chars);
  var tokens = new antlr4.CommonTokenStream(lexer);
  var parser = new ChatParser.PSR_ChatParser(tokens);
  parser.buildParseTrees = true;
  var tree = parser.chat();
  var htmlChat = new HtmlChatListener(resp);
  antlr4.tree.ParseTreeWalker.DEFAULT.walk(htmlChat, tree);

  resp.write('</body></html>');
  resp.end();
}).listen(1337);
