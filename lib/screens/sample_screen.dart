import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:getx_plain/screens/items_screen.dart';

class SampleScreen extends StatelessWidget {
  SampleScreen({Key? key}) : super(key: key);
  final controller = Get.put(SampleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You push count"),
            Obx(() => Text("${controller.count.value}")),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text("Increment"),
            ),
            ElevatedButton(
              onPressed: controller.push,
              child: Text("push page"),
            ),
            ElevatedButton(
              onPressed: controller.replace,
              child: Text("pop page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Sample", "hello",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: Text("snack bar"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog();
              },
              child: Text("dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

class SampleScreenController extends GetxController {
  var count = 0.obs;

  void increment() {
    count.value++;
  }

  void push() {
    Get.to(ItemsScreen());
  }

  void replace() {
    Get.off(ItemsScreen());
  }
}
