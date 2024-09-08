import 'package:gettest/data/models/auth/exist_body.dart';
import 'package:gettest/data/models/auth/exist_model.dart';
import 'package:gettest/data/models/auth/send_code_body.dart';
import 'package:gettest/data/models/auth/send_code_model.dart';
import 'package:gettest/data/models/auth/user_model.dart';
import 'package:gettest/data/models/auth/verify_body.dart';
import 'package:gettest/infrastructure/core/exceptions/failures.dart';
import 'package:gettest/utils/either.dart';

abstract class IAuthRepo {
  Future<Either<Failure, UserModel>> getMe();
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, SendCodeModel>> sendCode(SendCodeBody body);
  Future<Either<Failure, ExistModel>> exist(ExistBody body);
  Future<Either<Failure, bool>> verifyPost(VerifyBody body);
}
