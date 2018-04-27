import 'fruit.dart';
class AppState{
  final List<Fruit> fruitList;
  final bool isLoading;
  final int count;
  AppState({
    this.isLoading = false,
    this.fruitList = const [],
    this.count = 0
  });

  factory AppState.loading() => new AppState(isLoading:true,count: 0);

}