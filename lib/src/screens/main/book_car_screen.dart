import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:getx_plain/src/extensions/image_widgets.dart';
import 'package:getx_plain/src/extensions/title_widgets.dart';
import 'package:getx_plain/src/model/car.dart';

class BookCarScreen extends StatelessWidget {
  BookCarScreen({Key? key}) : super(key: key);
  static const routeName = '/BookCar';
  final car = Get.arguments as Car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 100,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [header(), body()],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 18,
      ),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "12 month",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "IDR ***",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "per month",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
          InkWell(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Select this Car",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              "Specification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.only(top: 10, left: 16),
            margin: EdgeInsets.only(bottom: 16),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                specificationCar("Color", "White"),
                specificationCar("Gearbox", "Automatic"),
                specificationCar("Seat", "4"),
                specificationCar("Motor", "v10 2.0"),
                specificationCar("Speed (0-100)", "3.2 sec"),
                specificationCar("Top Speed", "121 mph"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
          ),
          TitleWidgets(
            title: car.model,
            subtitle: car.brand,
          ),
          SizedBox(
            height: 20,
          ),
          ImagesCarousel(
            images: car.images,
            isExpanded: false,
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                pricePerPeriod("12", "5.55", true),
                SizedBox(
                  width: 16,
                ),
                pricePerPeriod("6", "5.55", false),
                SizedBox(
                  width: 16,
                ),
                pricePerPeriod("", "5.55", false),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget pricePerPeriod(String months, String price, bool selected) {
    return Expanded(
      child: Container(
        height: 95,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.grey[300]!, width: selected ? 0 : 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            months + " Months",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          Text(
            price,
            style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "DR",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 13,
            ),
          ),
        ]),
      ),
    );
  }

  Widget specificationCar(String title, String data) {
    return Container(
      width: 130,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
