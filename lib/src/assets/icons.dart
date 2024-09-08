import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const calendar = "assets/icons/calendar.svg";
  static const arrowRight = "assets/icons/arrow_right.svg";
  static const checkboxRadioActive = "assets/icons/checkbox_radio_active.svg";
  static const checkboxRadio = "assets/icons/checkbox_radio.svg";
  static const edit = "assets/icons/edit.svg";
  static const lenguage = "assets/icons/lenguage.svg";
  static const logout = "assets/icons/logout.svg";
  static const moon = "assets/icons/moon.svg";
  static const notification = "assets/icons/notification.svg";
  static const profile = "assets/icons/profile.svg";
  static const save = "assets/icons/save.svg";
  static const scan = "assets/icons/scan.svg";
  static const sun = "assets/icons/sun.svg";
  static const test = "assets/icons/test.svg";
  static const theme = "assets/icons/theme.svg";
  static const question = "assets/icons/question.svg";
  static const passing = "assets/icons/passing.svg";
  static const close = "assets/icons/close.svg";
  static const info = "assets/icons/info.svg";
  static const checkVerified = "assets/icons/check-verified.svg";
  static const warning = "assets/icons/warning.svg";
  static const missed = "assets/icons/missed.svg";
  static const upcoming = "assets/icons/upcoming.svg";
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
