import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/model/car.dart';

class BookCarScreen extends StatelessWidget {
  BookCarScreen({Key? key}) : super(key: key);
  static const routeName = '/BookCar';
  final car = Get.arguments as Car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Text(car.model),
      ),
    );
  }
}
