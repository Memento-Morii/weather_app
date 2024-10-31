import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/theme/color_theme.dart';
import '../common/theme/text_theme.dart';
import '../helpers/dialog_helpers.dart';

extension SnackBarTextStyles on ResponseMessage {
  String get message => describeEnum(this);
  TextStyle? get displayTextStyles {
    switch (this) {
      case ResponseMessage.error:
        return CustomTextTheme.whiteText;

      case ResponseMessage.warning:
        return CustomTextTheme.warningTextStyle;

      case ResponseMessage.success:
        return CustomTextTheme.whiteText;
        {}

      default:
        return null;
    }
  }
}

extension SnackBarIcons on ResponseMessage {
  String get message => describeEnum(this);
  Icon? get displayIcon {
    switch (this) {
      case ResponseMessage.error:
        return const Icon(Icons.error, color: Colors.white);

      case ResponseMessage.warning:
        return const Icon(
          Icons.warning,
          color: Colors.black,
        );

      case ResponseMessage.success:
        return const Icon(Icons.check, color: Colors.white);

      default:
        return null;
    }
  }
}

extension SnackBarBackgroundColors on ResponseMessage {
  String get message => describeEnum(this);
  Color? get displayBackgroundColor {
    switch (this) {
      case ResponseMessage.error:
        return CustomColors.errorColor;

      case ResponseMessage.warning:
        return CustomColors.warningColor;

      case ResponseMessage.success:
        return Colors.green.shade700;

      default:
        return null;
    }
  }
}

extension StringUtils on String {
  String? getLettersFromSingleWord({int characterLength = 1}) {
    return this[0];
  }

  String? getLettersFromMultipleWords(
      {Pattern splitPattern = " ",
      required int splitIndex,
      int characterLength = 0}) {
    String str = this;
    return str.split(splitPattern)[splitIndex][characterLength];
  }
}
