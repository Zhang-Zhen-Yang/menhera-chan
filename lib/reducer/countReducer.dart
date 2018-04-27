import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
final countReducer = combineTypedReducers<int>([
  new ReducerBinding<int,Actions>(_increment)
]);

int _increment(int count, Actions action){
  print(count);
  return ++count;
}