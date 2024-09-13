import 'package:dio/dio.dart';
import 'package:gettest/data/common/error_handle.dart';
import 'package:gettest/data/models/auth/exist_body.dart';
import 'package:gettest/data/models/auth/exist_model.dart';
import 'package:gettest/data/models/auth/send_code_body.dart';
import 'package:gettest/data/models/auth/send_code_model.dart';
import 'package:gettest/data/models/auth/user_model.dart';
import 'package:gettest/data/models/auth/verify_body.dart';
import 'package:gettest/infrastructure/core/dio_settings.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/infrastructure/repo/storage_repository.dart';
import 'package:gettest/src/assets/constants/storage_keys.dart';
import 'package:gettest/utils/device_info.dart';

abstract class AuthDatasourche {
  Future<UserModel> getMe();
  Future<SendCodeModel> sendCode(SendCodeBody body);
  Future<ExistModel> exist(ExistBody body);
  Future<bool> verifyPost(VerifyBody body);
  Future<bool> logout();
}

class AuthDataSourcheImpl implements AuthDatasourche {
  final dioAuth = serviceLocator<DioSettings>().dioForAuth;
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ExistModel> exist(ExistBody body) {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.post(
          '/v1/auth/exist',
          data: body.toJson(),
        );
      },
      body: (response) => ExistModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<UserModel> getMe() {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.get(
          '/v1/auth/me',
          options: Options(
            headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                ? {
                    'Authorization':
                        'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                  }
                : {},
          ),
        );
      },
      body: (response) => UserModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<SendCodeModel> sendCode(SendCodeBody body) {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.post(
          '/v1/otp/send-code',
          data: body.toJson(),
        );
      },
      body: (response) =>
          SendCodeModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<bool> logout() {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.post('/v1/auth/logout');
      },
      body: (response) => true,
    );
  }

  @override
  Future<bool> verifyPost(VerifyBody body) {
    return _handle.apiCantrol(
      request: () {
        return dio.post(
          '/v1/settings/verify',
          options: Options(
            headers: <String, dynamic>{
              'x-app-type': "user",
              'x-device-type': getDeviceType(),
              'x-device-model':
                  StorageRepository.getString(StorageKeys.deviceModel),
              'x-app-version': '0.0.1',
              'x-app-build': '1',
              'x-device-uid': "71C7B833-C6EA-4326-A8FF-CB8551867656",
              'x-app-lang': 'uz',
              'x-app-organization': StorageRepository.getInt(
                StorageKeys.ORGID,
                defValue: 2,
              ),
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ),
          data: body.toJson(),
        );
      },
      body: (response) => response["success"],
    );
  }
}
