import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plain/controllers/items_controller.dart';
import 'package:getx_plain/model/item.dart';
import 'package:getx_plain/screens/favorites_screen.dart';

class ItemsScreen extends StatelessWidget {
  ItemsScreen({Key? key}) : super(key: key);
  final ItemsController controller = Get.put(ItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fav Items'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Get.to(FavoriteScreen());
            },
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  "${controller.favoriteItems.length}",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return ItemCell(item: item, controller: controller);
              },
            ),
          )
        ],
      ),
    );
  }
}

class ItemCell extends StatelessWidget {
  const ItemCell({
    Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);

  final Item item;
  final ItemsController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(item.id),
      margin: EdgeInsets.all(15),
      color: Colors.amberAccent,
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(
          "${item.price.toStringAsFixed(2)}",
        ),
        trailing: Obx(
          () => IconButton(
            icon: Icon(Icons.favorite),
            color: item.isFavorite.value ? Colors.red : Colors.grey,
            onPressed: () {
              if (item.isFavorite.value) {
                controller.removeFav(item);
              } else {
                controller.addFav(item);
              }
            },
          ),
        ),
      ),
    );
  }
}
