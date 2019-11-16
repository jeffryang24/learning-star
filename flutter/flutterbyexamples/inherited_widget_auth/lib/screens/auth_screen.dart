import 'package:flutter/material.dart';

import '../app_state_container.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final container = AppStateContainer.of(context);

    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.white,
            onPressed: () => print('Login'),
            child: Container(
              width: 230.0,
              height: 50.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0
                    ),
                    child: Image.network(
                      'https://cdn3.iconfinder.com/data/icons/google-suits-1/32/1_google_search_logo_engine_service_suits-512.png',
                      width: 30.0,
                    ),
                  ),

                  Text(
                    'Sign In with Google',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}