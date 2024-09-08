import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:gettest/utils/enums.dart';

class MyFunction {
  static String formatPhoneNumber(String phoneNumber) {
    // Remove all non-numeric characters
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Remove leading '+' if present
    if (cleanedNumber.startsWith('998')) {
      return cleanedNumber;
    } else if (cleanedNumber.startsWith('998')) {
      return cleanedNumber.substring(1);
    }

    return cleanedNumber;
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static StatusTest statusTest({
    required String date1,
    required String date2,
  }) {
    // Parse the given date string into a DateTime object
    DateTime givenDate1 = DateTime.parse(date1);
    DateTime givenDate2 = DateTime.parse(date2);

    // Get the current date and time
    DateTime currentDate = DateTime.now();
    // Compare the two dates
    if (givenDate1.isAfter(currentDate)) {
      return StatusTest.upcoming;
    } else if (givenDate1.isBefore(currentDate) &&
        givenDate2.isAfter(currentDate)) {
      return StatusTest.statr;
    } else {
      return StatusTest.missed;
    }
  }
}
