import 'package:gettest/data/models/home/finish_model.dart';
import 'package:gettest/data/models/home/start_test_model.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/infrastructure/core/exceptions/failures.dart';
import 'package:gettest/utils/either.dart';

abstract class IHomeRepo {
  Future<Either<Failure, TestsModel>> getTests();
  Future<Either<Failure, StartTestsModel>> getTestStart(int id);
  Future<Either<Failure, bool>> getTestFinish(FinishModel list);
}
