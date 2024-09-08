import 'package:dio/dio.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/infrastructure/core/exceptions/exceptions.dart';
import 'package:gettest/infrastructure/core/exceptions/failures.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/utils/log_service.dart';

class ErrorHandle {
  Future<R> apiCantrol<T, R>(
      {required Future<Response<T>?> Function() request,
      required R Function(T response) body}) async {
    try {
      final response = await request();
      if (response!.statusCode! >= 200 && response.statusCode! < 300) {
        return body(response.data as T);
      }
      if (response.statusCode == 401) {
        serviceLocator<AuthBloc>().add(LogOutEvent());
      }
      Log.e(response.statusCode);
      throw ServerException(
        statusCode: response.statusCode ?? 0,
        errorMessage: response.statusMessage ?? "",
        // errorMessage: response.statusMessage ?? "",
      );
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      Log.e(e);
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      Log.e(e);
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }
}
