import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:getx_plain/src/data/samle_dealers.dart';
import 'package:getx_plain/src/data/sample_cars.dart';
import 'package:getx_plain/src/extensions/car_widget.dart';
import 'package:getx_plain/src/extensions/dealer_widget.dart';
import 'package:getx_plain/src/extensions/image_widgets.dart';
import 'package:getx_plain/src/extensions/title_widgets.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/model/car.dart';
import 'package:getx_plain/src/model/dealer.dart';

class HomeController extends GetxController {
  List<Car> cars = [];
  List<Dealer> dealers = [];

  late Car selectedCar;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() {
    cars = sampleCars;
    dealers = sampleDealers;
    selectedCar = cars[3];
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ctr = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 100,
          ),
          SafeArea(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Header(),
                  _AvailableArea(),
                  _TopDeals(),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Dealers",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                              ),
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Text(
                                    "More",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.only(bottom: 15),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: ctr.dealers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final dealer = ctr.dealers[index];
                            return DealerWidget(
                              dealer: dealer,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _TopDeals extends StatelessWidget {
  const _TopDeals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<HomeController>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Deals",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: ctr.cars.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final car = ctr.cars[index];

              return CarWidget(
                car: car,
                index: index,
              );
            },
          ),
        )
      ],
    );
  }
}

class _AvailableArea extends StatelessWidget {
  const _AvailableArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Container(
          padding: EdgeInsets.all(15),
          height: 100,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available Cars",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Term",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<HomeController>();

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
            height: 22,
          ),
          ImagesCarousel(images: ctr.selectedCar.images),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidgets(title: "title", subtitle: "subtitle"),
                InkWell(
                  onTap: () {
                    print("Dialog");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text(
                          "My Garage",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 23,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
