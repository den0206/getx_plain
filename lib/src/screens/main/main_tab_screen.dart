import 'package:badges/badges.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_plain/src/screens/home/home_screen.dart';
import 'package:getx_plain/src/screens/search/search_screen.dart';
import 'package:line_icons/line_icons.dart';

class TabController extends GetxController {
  final pageController = PageController();
  final animationDuration = Duration(milliseconds: 350);
  late List<BottomNavyBarItem> navigationItems;
  var currntIndex = 0;

  @override
  void onInit() {
    navigationItems = [
      BottomNavyBarItem(icon: Icon(LineIcons.home), title: Text("Home")),
      BottomNavyBarItem(icon: Icon(LineIcons.search), title: Text("Search")),
      BottomNavyBarItem(
        title: Text("Notification"),
        icon: Badge(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 4, left: 5),
          animationType: BadgeAnimationType.scale,
          animationDuration: Duration(milliseconds: 200),

          /// state mng
          badgeContent: Text(
            "9",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          child: Icon(
            LineIcons.bell,
            color: Colors.black54,
          ),
        ),
      )
    ];
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    Get.delete();
    super.onClose();
  }

  void setTabIndex(int value) {
    currntIndex = value;
    pageController.animateToPage(
      currntIndex,
      duration: animationDuration,
      curve: Curves.ease,
    );
    update();
  }
}

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  static const routeName = '/Main';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabController>(
      init: TabController(),
      builder: (ctr) {
        return Scaffold(
          body: PageView(
            controller: ctr.pageController,
            onPageChanged: ctr.setTabIndex,
            physics: NeverScrollableScrollPhysics(),
            children: [HomeScreen(), SearchScreen(), Text("Notification")],
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: ctr.currntIndex,
            onItemSelected: ctr.setTabIndex,
            items: ctr.navigationItems,
          ),
        );
      },
    );
  }
}
