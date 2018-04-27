import '../models/app_state.dart';
import 'fruitReducer.dart';

AppState appReducer(AppState state, action){
  return new  AppState(
    //isLoading: 
    fruitList: fruitReducer(state.fruitList, action)
  );
}