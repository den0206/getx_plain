import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_plain/src/screens/main/home_screen.dart';
import 'package:line_icons/line_icons.dart';

class TabController extends GetxController {
  final pageController = PageController();
  final animationDuration = Duration(milliseconds: 350);
  late List<BottomNavyBarItem> navigationItems;
  var currntIndex = 0.obs;

  @override
  void onInit() {
    navigationItems = [
      BottomNavyBarItem(icon: Icon(LineIcons.home), title: Text("Home")),
      BottomNavyBarItem(icon: Icon(LineIcons.search), title: Text("Search")),
    ];
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    Get.delete();
    super.onClose();
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
            onPageChanged: (index) {
              ctr.currntIndex.value = index;
            },
            physics: NeverScrollableScrollPhysics(),
            children: [HomeScreen(), Text("Search")],
          ),
          bottomNavigationBar: Obx(
            () => BottomNavyBar(
              selectedIndex: ctr.currntIndex.value,
              onItemSelected: (index) {
                ctr.currntIndex.value = index;
                ctr.pageController.animateToPage(
                  index,
                  duration: ctr.animationDuration,
                  curve: Curves.ease,
                );
              },
              items: ctr.navigationItems,
            ),
          ),
        );
      },
    );
  }
}
