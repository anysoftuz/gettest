import 'package:gettest/data/common/error_handle.dart';
import 'package:gettest/data/models/home/finish_model.dart';
import 'package:gettest/data/models/home/start_test_model.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/infrastructure/core/dio_settings.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';

abstract class HomeDatasource {
  Future<TestsModel> getTests();
  Future<StartTestsModel> getTestStart(int id);
  Future<bool> getTestFinish(FinishModel list);
}

class HomeDatasourceImpl implements HomeDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();
  @override
  Future<StartTestsModel> getTestStart(int id) {
    return _handle.apiCantrol(
      request: () {
        return dio.post('/v1/tests/$id/start');
      },
      body: (response) =>
          StartTestsModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<TestsModel> getTests() {
    return _handle.apiCantrol(
      request: () {
        return dio.get('/v1/tests?page=1&per_page=100');
      },
      body: (response) => TestsModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<bool> getTestFinish(FinishModel list) {
    return _handle.apiCantrol(
      request: () {
        return dio.get('/v1/tests?page=1&per_page=100');
      },
      body: (response) => true,
    );
  }
}
