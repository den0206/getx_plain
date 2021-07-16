import 'package:get/state_manager.dart';

class Item {
  int id;
  String name;
  double price;
  RxBool isFavorite;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.isFavorite,
  });
}
