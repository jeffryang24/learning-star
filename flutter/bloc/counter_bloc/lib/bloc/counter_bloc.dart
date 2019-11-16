import 'package:bloc/bloc.dart';

import '../actions/counter_action.dart';

class CounterBloc extends Bloc<CounterAction, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int currentState, CounterAction event) async* {
    if (event is ActionIncrementValue) {
      yield currentState + 1;
    } else if (event is ActionDecreamentValue) {
      yield currentState - 1;
    }
  }
}