import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
final fruitReducer = combineTypedReducers<List<Fruit>>([
  new ReducerBinding<List<Fruit>,AddFruitAction>(_addFruit)
]);

List<Fruit> _addFruit(List<Fruit> fruitList, AddFruitAction action){
  return new List.from(fruitList)..add(action.fruit);
}