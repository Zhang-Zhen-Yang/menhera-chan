import 'package:flutter/material.dart';
import 'main1.dart' show MyApp;
import 'actions/actions.dart'; 

// import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'main_flutter.dart';
import 'reducer/app_state_reducer.dart';
import 'models/app_state.dart';
// One simple action: Increment
// enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    print('state:$state');
    return state + 1;
  }

  return state;
}


//import 'main2.dart' show MyApp;
void main() { 
  // runApp(new MyApp());


  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  // final store = new Store<int>(counterReducer, initialState: 0);
  final store = new Store<AppState>(appReducer, initialState: new AppState.loading());
  
  runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));

}