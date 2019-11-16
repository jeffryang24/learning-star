import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';
import '../../actions/counter_action.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BLOC'),
      ),
      body: BlocBuilder<CounterAction, int>(
        bloc: _bloc,
        builder: (BuildContext context, int count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 24.0
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0
            ),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _bloc.dispatch(ActionIncrementValue());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0
            ),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _bloc.dispatch(ActionDecreamentValue());
              },
            ),
          )
        ],
      ),
    );
  }
}
