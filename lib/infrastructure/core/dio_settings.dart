import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gettest/infrastructure/repo/storage_repository.dart';
import 'package:gettest/src/assets/constants/storage_keys.dart';
import 'package:gettest/utils/device_info.dart';
import 'package:gettest/utils/log_service.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: "https://api.gettest.uz/api",
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'x-app-type': "user",
      'x-device-type': getDeviceType(),
      'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
      'x-app-version': '0.0.1',
      'x-app-build': '1',
      'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
      'x-app-organization': StorageRepository.getInt(StorageKeys.ORGID),
      'x-app-lang': StorageRepository.getString(
        StorageKeys.LANGUAGE,
        defValue: 'uz',
      ),
      'Authorization':
          'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: "https://api.gettest.uz/api",
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'x-app-type': "user",
        'x-device-type': getDeviceType(),
        'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
        'x-app-version': '0.0.1',
        'x-app-build': '1',
        'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
        'x-app-lang': lang,
        'x-app-organization': StorageRepository.getInt(StorageKeys.ORGID),
        'Authorization':
            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  final BaseOptions _dioBaseOptionsForAuth = BaseOptions(
    baseUrl: "https://api.gettest.uz/api",
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'x-app-type': "user",
      'x-device-type': getDeviceType(),
      'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
      'x-app-version': '0.0.1',
      'x-app-build': '1',
      'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
      'x-app-lang': StorageRepository.getString(
        StorageKeys.LANGUAGE,
        defValue: 'uz',
      ),
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptionsForAuth({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: "https://api.gettest.uz/api",
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'x-app-type': "user",
        'x-device-type': getDeviceType(),
        'x-device-model': StorageRepository.getString(StorageKeys.deviceModel),
        'x-app-version': '0.0.1',
        'x-app-build': '1',
        'x-device-uid': StorageRepository.getString(StorageKeys.deviceId),
        'x-app-lang': StorageRepository.getString(
          StorageKeys.LANGUAGE,
          defValue: 'uz',
        ),
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  BaseOptions get dioBaseOptionsForAuth => _dioBaseOptionsForAuth;

  bool get chuck =>
      StorageRepository.getBool(StorageKeys.CHUCK, defValue: false);

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: kDebugMode,
          request: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
          error: kDebugMode,
        ),
        ErrorHandlerInterceptor(),
      ],
    );

  Dio get dioForAuth => Dio(_dioBaseOptionsForAuth)
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: kDebugMode,
          request: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
          error: kDebugMode,
        ),
        ErrorHandlerInterceptor(),
      ],
    );
}

class ErrorHandlerInterceptor implements Interceptor {
  ErrorHandlerInterceptor._();

  static final _instance = ErrorHandlerInterceptor._();

  factory ErrorHandlerInterceptor() => _instance;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionTimeout) {
      Log.e("Time Out");
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {}
    handler.next(response);
  }
}
