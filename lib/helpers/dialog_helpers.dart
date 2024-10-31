import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/theme/color_theme.dart';
import 'package:weather_app/extension/utils.dart';

enum DialogAction { yes, no }

enum ResponseMessage {
  error,
  warning,
  success,
}

class DialogHelpers {
  static DialogHelpers? dialogHelpers;

  static DialogHelpers? getInstance() {
    dialogHelpers ??= DialogHelpers();
    return dialogHelpers;
  }

  showSnackBarGetx(
    String content,
    ResponseMessage responseMessage,
  ) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        content,
        style: responseMessage.displayTextStyles,
      ),
      duration: const Duration(seconds: 3),
      titleText: Container(),
      margin: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight, left: 8, right: 8),
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 16, right: 16),
      borderRadius: 4,
      icon: responseMessage.displayIcon,
      backgroundColor: responseMessage.displayBackgroundColor,
      colorText: CustomColors.titleColor,
    );
  }
}
