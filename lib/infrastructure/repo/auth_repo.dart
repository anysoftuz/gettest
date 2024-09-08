import 'package:dio/dio.dart';
import 'package:gettest/data/abstract_repo/i_auth_repo.dart';
import 'package:gettest/data/models/auth/exist_body.dart';
import 'package:gettest/data/models/auth/exist_model.dart';
import 'package:gettest/data/models/auth/send_code_body.dart';
import 'package:gettest/data/models/auth/send_code_model.dart';
import 'package:gettest/data/models/auth/user_model.dart';
import 'package:gettest/data/models/auth/verify_body.dart';
import 'package:gettest/infrastructure/apis/auth_datasource.dart';
import 'package:gettest/infrastructure/core/exceptions/exceptions.dart';
import 'package:gettest/infrastructure/core/exceptions/failures.dart';
import 'package:gettest/utils/either.dart';

class AuthRepo implements IAuthRepo {
  final AuthDataSourcheImpl dataSourcheImpl;

  AuthRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, ExistModel>> exist(ExistBody body) async {
    // bool isConnection = await isInternetConnected();
    // if (isConnection) {
    //   return Left(NetworkFailure(errorMessage: "Internet yo'q"));
    // }
    try {
      final result = await dataSourcheImpl.exist(body);
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
  Future<Either<Failure, UserModel>> getMe() async {
    // bool isConnection = await isInternetConnected();
    // if (isConnection) {
    //   return Left(NetworkFailure(errorMessage: "Internet yo'q"));
    // }
    try {
      final result = await dataSourcheImpl.getMe();
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
  Future<Either<Failure, SendCodeModel>> sendCode(SendCodeBody body) async {
    // bool isConnection = await isInternetConnected();
    // Log.w("Biz keldu");
    // if (isConnection) {
    //   Log.w("Bizda internet yo'q");
    //   return Left(NetworkFailure(errorMessage: "Internet yo'q"));
    // }
    // Log.w("Biz keldik");
    try {
      final result = await dataSourcheImpl.sendCode(body);
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
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await dataSourcheImpl.logout();
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
  Future<Either<Failure, bool>> verifyPost(VerifyBody body) async {
    try {
      final result = await dataSourcheImpl.verifyPost(body);
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
