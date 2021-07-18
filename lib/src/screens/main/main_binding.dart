import 'package:get/instance_manager.dart';
import 'package:getx_plain/src/screens/home/home_controller.dart';
import 'package:getx_plain/src/screens/search/search_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SearchController());
  }
}