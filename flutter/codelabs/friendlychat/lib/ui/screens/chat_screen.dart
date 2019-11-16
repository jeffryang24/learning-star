import 'package:flutter/material.dart';

import '../widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _txtController = TextEditingController();
  List<ChatMessage> _messages = [];
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _txtController,
                  onSubmitted: _handleSubmitted,
                  onChanged: (String value) {
                    setState(() {
                      _isComposing = value.length > 0;
                    });
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a message',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _isComposing ? () => _handleSubmitted(_txtController.text) : null,
                ),
              ),
            ],
          )),
    );
  }

  void _handleSubmitted(String value) {
    _txtController.clear();

    setState(() {
      _isComposing = false;
    });

    ChatMessage message = ChatMessage(
      text: value,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );

    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }
}
