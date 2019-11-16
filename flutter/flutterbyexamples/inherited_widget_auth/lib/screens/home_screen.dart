import 'package:flutter/material.dart';

import '../models/app_state.dart';
import '../app_state_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppState appState;

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);

    appState = container.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Suite'),
      ),
      body: _pageToDisplay,
    );
  }

  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    } else {
      return _homeView;
    }
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get _homeView {
    return Center(
      child: Text(appState.user?.displayName),
    );
  }
}