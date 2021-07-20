import 'package:get/instance_manager.dart';
import 'package:getx_plain/src/screens/home/home_controller.dart';
import 'package:getx_plain/src/screens/notification/notification_controller.dart';
import 'package:getx_plain/src/screens/profile/profile_controller.dart';
import 'package:getx_plain/src/screens/search/search_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SearchController());
    Get.put(NotificationController());
    Get.put(ProfileController());
  }
}
