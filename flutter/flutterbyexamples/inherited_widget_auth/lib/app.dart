import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';

class AppRootWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppRootWidgetState();
}

class _AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => ThemeData(
    primaryColor: Colors.cyan,
    accentColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[300],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget',
      theme: _themeData,
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/auth': (BuildContext context) => AuthScreen(),
      },
    );
  }
}