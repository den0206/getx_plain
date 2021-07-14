import 'dart:math';

import 'package:get/get.dart';
import 'package:getx_plain/model/item.dart';

class ItemsController extends GetxController {
  final _items = List.generate(
      100,
      (index) => Item(
          id: index,
          name: "Product $index",
          price: Random().nextDouble() * 100,
          isFavorite: false.obs)).obs;

  List<Item> get items => _items;

  List<Item> get favoriteItems {
    return _items.where((item) => item.isFavorite.value == true).toList();
  }

  void addFav(Item eitem) {
    final index = _items.indexWhere((item) => eitem.id == item.id);
    _items[index].isFavorite.value = true;
  }

  void removeFav(Item eitem) {
    final index = _items.indexWhere((item) => eitem.id == item.id);
    _items[index].isFavorite.value = false;
  }
}
