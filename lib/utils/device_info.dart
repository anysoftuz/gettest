import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = 'none';

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // Android device ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? "none ios"; // iOS device ID
    }
  } catch (e) {
    debugPrint('Failed to get device ID: $e');
  }

  return deviceId;
}

Future<String> getDeviceModel() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = 'none';

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.model; // Android device ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.model; // iOS device ID
    }
  } catch (e) {
    debugPrint('Failed to get device ID: $e');
  }

  return deviceId;
}

String getDeviceType() {
  String deviceId = 'none';
  if (Platform.isAndroid) {
    deviceId = "android"; // Android device ID
  } else if (Platform.isIOS) {
    deviceId = "ios"; // iOS device ID
  }

  return deviceId;
}
