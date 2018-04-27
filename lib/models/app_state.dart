import 'fruit.dart';
class AppState{
  final List<Fruit> fruitList;
  final bool isLoading;
  AppState({
    this.isLoading = false,
    this.fruitList = const []
  });

  factory AppState.loading() => new AppState(isLoading:true);

}