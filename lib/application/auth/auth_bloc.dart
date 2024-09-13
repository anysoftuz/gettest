import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gettest/data/models/auth/exist_body.dart';
import 'package:gettest/data/models/auth/send_code_body.dart';
import 'package:gettest/data/models/auth/send_code_model.dart';
import 'package:gettest/data/models/auth/user_model.dart';
import 'package:gettest/data/models/auth/verify_body.dart';
import 'package:gettest/infrastructure/core/dio_settings.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/infrastructure/repo/auth_repo.dart';
import 'package:gettest/infrastructure/repo/storage_repository.dart';
import 'package:gettest/src/assets/constants/storage_keys.dart';
import 'package:gettest/utils/log_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:formz/formz.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

Future<bool> isInternetConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var connectionChecker = InternetConnectionChecker();
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet) ||
      connectivityResult.contains(ConnectivityResult.vpn) ||
      connectivityResult.contains(ConnectivityResult.bluetooth) &&
          await connectionChecker.hasConnection) {
    return true; // Connected to mobile data or Wi-Fi
  } else {
    return false; // Not connected to the internet
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repository;
  AuthBloc(this._repository) : super(const AuthState()) {
    on<CheckUserEvent>((event, emit) {
      final token = StorageRepository.getString(StorageKeys.TOKEN);
      if (token.isEmpty) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        add(GetMeEvent());
      }
    });

    on<GetMeEvent>((event, emit) async {
      final response = await _repository.getMe();
      if (response.isRight) {
        if (response.right.success) {
          if (response.right.data.user.organizations.isNotEmpty) {
            await StorageRepository.putInt(
              StorageKeys.ORGID,
              response.right.data.user.organizations.first.id,
            );
            serviceLocator<DioSettings>().setBaseOptions(lang: 'uz');
          }
          emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            userModel: response.right,
          ));
        } else {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
        }
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });

    on<SendCodeEvent>((event, emit) async {
      emit(state.copyWith(statusCode: FormzSubmissionStatus.inProgress));
      final body = SendCodeBody(phone: event.phone);
      final response = await _repository.sendCode(body);
      Log.e(response);
      if (response.isRight) {
        if (response.right.success) {
          emit(state.copyWith(statusCode: FormzSubmissionStatus.success));
          event.onSucces(response.right);
        } else {
          emit(state.copyWith(statusCode: FormzSubmissionStatus.failure));
          event.onError();
        }
      } else {
        emit(state.copyWith(statusCode: FormzSubmissionStatus.failure));
        event.onError();
      }
    });
    on<ExistEvent>((event, emit) async {
      emit(state.copyWith(statusCode: FormzSubmissionStatus.inProgress));
      final body = ExistBody(
        phone: event.phone,
        code: event.code,
        otpSessionId: event.sessionId,
      );
      final response = await _repository.exist(body);
      Log.e(response);
      if (response.isRight) {
        if (response.right.data.exists) {
          await StorageRepository.putString(
            StorageKeys.TOKEN,
            response.right.data.token.accessToken,
          );
          emit(state.copyWith(statusCode: FormzSubmissionStatus.success));
          add(GetMeEvent());
        } else {
          event.onError(0);
        }
      } else {
        emit(state.copyWith(statusCode: FormzSubmissionStatus.failure));
        event.onError(1);
      }
    });

    on<MyIdVerifyEvent>((event, emit) async {
      emit(state.copyWith(statusMyId: FormzSubmissionStatus.inProgress));
      final model = VerifyBody(
        image: event.base64,
        comparisonValue: event.comparisonValue,
        externalId: event.externalId,
        code: event.authCode,
      );
      final response = await _repository.verifyPost(model);
      Log.e(response);
      if (response.isRight) {
        if (response.right) {
          emit(state.copyWith(statusMyId: FormzSubmissionStatus.success));
          event.onSucces();
        } else {
          emit(state.copyWith(statusMyId: FormzSubmissionStatus.failure));
          event.onError();
        }
      } else {
        emit(state.copyWith(statusMyId: FormzSubmissionStatus.failure));
        event.onError();
      }
    });

    on<LogOutEvent>((event, emit) async {
      emit(state.copyWith(statusCode: FormzSubmissionStatus.inProgress));
      final response = await _repository.logout();
      Log.e(response);
      if (response.isRight) {
        await StorageRepository.putString(StorageKeys.TOKEN, "");
        emit(state.copyWith(
          statusCode: FormzSubmissionStatus.success,
          status: AuthenticationStatus.unauthenticated,
        ));
      } else {
        emit(state.copyWith(
          statusCode: FormzSubmissionStatus.failure,
          status: AuthenticationStatus.unauthenticated,
        ));
      }
    });
  }
}
