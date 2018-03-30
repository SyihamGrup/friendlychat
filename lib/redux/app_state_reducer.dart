import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:friendlychat/redux/actions.dart';
import 'package:friendlychat/redux/app_state.dart';


AppState appStateReducer(AppState state, dynamic action) {
  return new AppState(
//    counter: counterReducer(state.counter, action),
  );
}

//final counterReducer = combineTypedReducers<int>([
//  new ReducerBinding<int, CounterOnDataEventAction>(_setCounter),
//]);

int _setCounter(int oldCounter, dynamic action) {
  return action.counter;
}