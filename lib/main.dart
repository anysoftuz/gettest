import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettest/firebase_options.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/infrastructure/repo/storage_repository.dart';
import 'package:gettest/src/assets/constants/storage_keys.dart';
import 'package:gettest/utils/bloc_logger.dart';
import 'package:gettest/utils/device_info.dart';

import 'app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await StorageRepository.getInstance();
  await StorageRepository.putString(StorageKeys.deviceId, await getDeviceId());
  await StorageRepository.putString(
    StorageKeys.deviceModel,
    await getDeviceModel(),
  );
  setupLocator();
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  runApp(MyApp(settingsController: settingsController));
}
