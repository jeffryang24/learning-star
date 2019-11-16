import 'package:flutter/material.dart';

import './src/app.dart';

void main() => runApp(Pics());

class Pics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s See Images!',
      home: App(),
    );
  }
}