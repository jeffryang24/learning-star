import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/app_state.dart';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state
  });

  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer) as _InheritedStateContainer).data;
  }

  @override
  State<StatefulWidget> createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState state;
  GoogleSignInAccount googleUser;

  final googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = AppState.loading();
      _startCountdown();
    }
  }

  Future<Null> initUser() async {
    googleUser = await _ensureLoggedInStartup();

    if (googleUser == null) {
      setState(() {
        state.isLoading = false;
      });
    }
  }

  Future<GoogleSignInAccount> _ensureLoggedInStartup() async {
    GoogleSignInAccount user = googleSignIn.currentUser;
    if (user == null) {
      user = await googleSignIn.signInSilently();
    }

    googleUser = user;
    return user;
  }

  Future<Null> _startCountdown() async {
    const timeOut = const Duration(seconds: 2);
    Timer(timeOut, () {
      setState(() => state.isLoading = false);
    });
  }

  Future<Null> loginIntoFirebase() async {
    if (googleUser == null) {
      googleUser = await googleSignIn.signIn();
    }

    FirebaseUser firebaseUser;
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      firebaseUser = await _auth.signInWithCredential(credential);

      print('Logged in: ${firebaseUser.displayName}');

      setState(() {
        state.isLoading = false;
        state.user = firebaseUser;
      });
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}