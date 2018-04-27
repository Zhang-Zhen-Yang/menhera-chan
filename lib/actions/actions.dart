import '../models/fruit.dart';

enum Actions { Increment }


class AddFruitAction{
  Fruit fruit;
  AddFruitAction(this.fruit);
}

