import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:getx_plain/src/model/notification.dart';
import 'package:getx_plain/src/screens/notification/notification_controller.dart';
import 'package:getx_plain/src/sec/convert_helper.dart';

class NotifivationScreen extends GetView<NotificationController> {
  const NotifivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: ListView.builder(
            padding: EdgeInsets.only(top: 7),
            itemCount: controller.times.length,
            itemBuilder: (BuildContext context, int index) {
              final date = controller.times[index];
              return DateCell(date: date);
            },
          ),
        ),
      ),
    );
  }
}

class DateCell extends StatelessWidget {
  const DateCell({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
        Get.find<NotificationController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Text(
              ConverterHelper.dateFormatYmdOnly(DateTime.now()) ==
                      ConverterHelper.dateFormatYmdOnly(date)
                  ? "New"
                  :
                  // : ConverterHelper.stringFormatDmyHeader(date, "jp") ??
                  "Unknown",
            ),
          ),
          ...controller.notificationMessages
              .where((element) =>
                  ConverterHelper.dateFormatYmdOnly(element.date) ==
                  ConverterHelper.dateFormatYmdOnly(date))
              .map((e) => NotificationCell(notification: e))
              .toList()
        ],
      ),
    );
  }
}

class NotificationCell extends StatelessWidget {
  const NotificationCell({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationMessage notification;

  @override
  Widget build(BuildContext context) {
    final conteroller = Get.find<NotificationController>();

    /// cell Action
    return Dismissible(
      key: UniqueKey(),
      background: deleteLabel(MainAxisAlignment.start),
      secondaryBackground: deleteLabel(MainAxisAlignment.end),
      resizeDuration: Duration(seconds: 1),
      onDismissed: (direction) {
        conteroller.deletNotification(notification);
      },
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
          decoration: BoxDecoration(
            color: notification.isRead
                ? Colors.white
                : kPrimaryColor.withOpacity(0.9),
          ),
          child: Container(
            child: Row(
              children: [
                notification.iconURL == null
                    ? Container()
                    : Padding(padding: EdgeInsets.all(8), child: Container()),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: notification.isRead
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    notification.content,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: notification.isRead
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget deleteLabel(MainAxisAlignment mainaxis) {
    return Container(
      color: Colors.red.withOpacity(0.4),
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: mainaxis,
        children: [
          Icon(Icons.delete, color: Colors.red),
          SizedBox(
            width: 7,
          ),
          Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
