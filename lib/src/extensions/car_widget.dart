import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/model/car.dart';
import 'package:getx_plain/src/screens/home/book_car_screen.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({
    Key? key,
    required this.car,
    this.index,
  }) : super(key: key);

  final Car car;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(BookCarScreen.routeName, arguments: car);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        width: 280,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(
          right: index != null ? 16 : 0,
          left: index == 0 ? 16 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    car.condition,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 95,
              child: Center(
                child: Hero(
                  tag: car.model,
                  child: Image.asset(
                    car.images[0],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              car.brand,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              "per " +
                  (car.condition == "Daily"
                      ? "day"
                      : car.condition == "Weekly"
                          ? "week"
                          : "month"),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
