import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_plain/src/model/notification.dart';
import 'package:getx_plain/src/sec/sample_notification.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxList notificationMessages = [].obs;
  List<DateTime> times = [];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    notificationMessages.value = NotificationService().getMessageList();
    times = NotificationService().getMessageDateList();
  }

  void deletNotification(NotificationMessage notification) {
    notificationMessages.remove(notification);
  }
}
