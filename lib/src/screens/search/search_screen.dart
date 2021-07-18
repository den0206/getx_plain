import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:getx_plain/src/extensions/car_widget.dart';
import 'package:getx_plain/src/model/car.dart';
import 'package:getx_plain/src/screens/search/search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _searchField(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search Result",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "all",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    size: 12, color: kPrimaryColor),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 280,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.cars.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final Car resultCar = controller.cars[index];

                            return CarWidget(
                              car: resultCar,
                              index: index,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _searchField() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.only(left: 30),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 24, left: 16),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
