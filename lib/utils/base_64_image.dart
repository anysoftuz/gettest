import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:gettest/src/assets/images.dart';

Image imageFromBase64String(String base64String) {
  try {
    return Image.memory(
      base64Decode(base64Encode(utf8.encode(base64String))),
      fit: BoxFit.cover,
    );
  } catch (e) {
    return Image.asset(AppImages.gettest);
  }
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(String data) {
  return base64Encode(utf8.encode(data));
}
