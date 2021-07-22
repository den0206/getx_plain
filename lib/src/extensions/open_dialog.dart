import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

class OpenDialog {
  static Future<void> showSuccess(String message,
      {String? title, Duration? duration}) async {
    Get.snackbar(
      title ?? "Success",
      message,
      backgroundColor: Colors.green[400],
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      borderRadius: 5,
      icon: Icon(LineIcons.checkCircle, color: Colors.white),
      colorText: Colors.white,
      animationDuration: Duration(
        milliseconds: 1200,
      ),
      duration: duration,
    );
  }

  static Future<void> showError(String message, {Duration? duration}) async {
    Get.snackbar(
      "Error Massage",
      message,
      backgroundColor: Colors.red[400],
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      borderRadius: 5,
      icon: Icon(LineIcons.exclamationCircle, color: Colors.white),
      colorText: Colors.white,
      animationDuration: Duration(
        milliseconds: 1200,
      ),
      duration: duration,
    );
  }

  static Future<T?> info<T>({
    required String title,
    required String content,
    required String lottieFile,
    EdgeInsets? lottiePadding,
    String? labelBUtton,
    Function()? onClick,
    Widget? customWoiget,
    bool isBackAfffer = true,
  }) async {
    return await showAnimatedDialog(
      context: Get.context!,
      barrierDismissible: true,
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      builder: (context) {
        return InfoDialog(
          title: title,
          content: content,
          lottieFilename: lottieFile,
          lottiePadding: lottiePadding ?? EdgeInsets.all(16),
          labelButton: labelBUtton ?? "Sample",
          onPressed: () {
            if (isBackAfffer) Get.back();

            if (onClick != null) onClick();
          },
          customWidget: customWoiget,
        );
      },
    );
  }

  static Future<T?> confitm<T>({
    required String title,
    required String content,
    required String lottieFile,
    String? labelBUtton,
    Function()? onNoClick,
    Function()? onYesClick,
    Widget? customWoiget,
    bool isBackAfterYes = true,
    bool isBackAfffer = true,
  }) async {
    showAnimatedDialog(
      context: Get.context!,
      barrierDismissible: true,
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      builder: (context) {
        return ConfirmDialog(
          title: title,
          content: content,
          lottieFilename: lottieFile,
          onLeftPressed: () {
            Get.back();
            if (onNoClick != null) onNoClick();
          },
          onRightPressed: () {
            Get.back();
            if (onYesClick != null) onYesClick();
          },
          customWidget: customWoiget,
        );
      },
    );
  }
}

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    this.title,
    this.content,
    this.lottieFilename,
    required this.lottiePadding,
    this.labelButton,
    this.colorButton,
    this.colorTextButton,
    this.fontSizeButton,
    this.onPressed,
    this.customWidget,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? content;
  final String? lottieFilename;
  final EdgeInsets lottiePadding;
  final String? labelButton;
  final Color? colorButton;
  final Color? colorTextButton;
  final double? fontSizeButton;
  final Function()? onPressed;

  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (lottieFilename == null)
                  ? Container()
                  : Padding(
                      padding: lottiePadding.copyWith(bottom: 15.0),
                      child: Lottie.asset(
                        "assets/lottie/$lottieFilename.json",
                        height: 130,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
              (title == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        title!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              (content == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: Text(
                        content!,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
              (customWidget == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: customWidget,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InkWell(
                  onTap: onPressed,
                  child: Container(
                    height: 45,
                    color: colorButton,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      labelButton ?? "Ok, Thanks!",
                      style: TextStyle(
                        color: colorTextButton,
                        fontSize: fontSizeButton ?? 16,
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    this.title,
    this.content,
    this.lottieFilename,
    this.labelLeftButton,
    this.labelRightButton,
    this.colorLeftButton = Colors.grey,
    this.colorRightButton = Colors.green,
    this.colorLeftTextButton = Colors.black,
    this.colorRightTextButton = Colors.white,
    this.fontSizeLeftButton,
    this.fontSizeRightButton,
    required this.onLeftPressed,
    required this.onRightPressed,
    this.customWidget,
    Key? key,
  }) : super(key: key);

  final String? title, content, lottieFilename;
  final String? labelLeftButton, labelRightButton;
  final Color colorLeftButton, colorRightButton;
  final Color? colorLeftTextButton, colorRightTextButton;
  final double? fontSizeLeftButton, fontSizeRightButton;
  final Function() onLeftPressed;
  final Function() onRightPressed;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (lottieFilename == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, top: 20),
                      child: Lottie.asset(
                        "assets/lottie/$lottieFilename.json",
                        height: 130,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
              (title == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        title!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              (content == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: Text(
                        content!,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
              (customWidget == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: customWidget,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onLeftPressed,
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                          child: Center(
                              child: Text(
                            labelLeftButton ?? "Cancel",
                            style: TextStyle(
                                color: colorLeftTextButton,
                                fontSize: fontSizeLeftButton ?? 16),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: onRightPressed,
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            labelRightButton ?? "Yes",
                            style: TextStyle(
                                color: colorRightTextButton ?? Colors.white,
                                fontSize: fontSizeRightButton ?? 16),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
