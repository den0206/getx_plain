import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/controllers/items_controller.dart';
import 'package:getx_plain/src/screens/items_screen.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final ItemsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.favoriteItems.length,
            itemBuilder: (context, index) {
              final item = controller.favoriteItems[index];

              return ItemCell(item: item, controller: controller);
            },
          )),
    );
  }
}
