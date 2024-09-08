import 'package:dio/dio.dart';
import 'package:gettest/data/abstract_repo/i_home_repo.dart';
import 'package:gettest/data/models/home/finish_model.dart';
import 'package:gettest/data/models/home/start_test_model.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/infrastructure/apis/home_datasource.dart';
import 'package:gettest/infrastructure/core/exceptions/exceptions.dart';
import 'package:gettest/infrastructure/core/exceptions/failures.dart';
import 'package:gettest/utils/either.dart';

class HomeRepoImpl implements IHomeRepo {
  final HomeDatasourceImpl dataSourcheImpl;

  HomeRepoImpl({required this.dataSourcheImpl});
  @override
  Future<Either<Failure, StartTestsModel>> getTestStart(int id) async {
    try {
      final result = await dataSourcheImpl.getTestStart(id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, TestsModel>> getTests() async {
    try {
      final result = await dataSourcheImpl.getTests();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> getTestFinish(FinishModel list) async{
 try {
      final result = await dataSourcheImpl.getTestFinish(list);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }
}
