import '../models/app_state.dart';
import 'fruitReducer.dart';
import 'countReducer.dart';

AppState appReducer(AppState state, action){
  return new  AppState(
    //isLoading: 
    fruitList: fruitReducer(state.fruitList, action),
    count: countReducer(state.count, action)
  );
}