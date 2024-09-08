part of 'auth_bloc.dart';

sealed class AuthEvent {}

class SendCodeEvent extends AuthEvent {
  final String phone;
  final VoidCallback onError;
  final Function(SendCodeModel model) onSucces;

  SendCodeEvent({
    required this.phone,
    required this.onError,
    required this.onSucces,
  });
}

class ExistEvent extends AuthEvent {
  final String code;
  final String phone;
  final String sessionId;
  final Function(int id) onError;

  ExistEvent({
    required this.code,
    required this.onError,
    required this.phone,
    required this.sessionId,
  });
}

class GetMeEvent extends AuthEvent {}

class CheckUserEvent extends AuthEvent {}

class MyIdVerifyEvent extends AuthEvent {
  final String base64;
  final String comparisonValue;
  final String externalId;
  final String authCode;
  final VoidCallback onError;
  final VoidCallback onSucces;

  MyIdVerifyEvent({
    required this.base64,
    required this.authCode,
    required this.comparisonValue,
    required this.externalId,
    required this.onError,
    required this.onSucces,
  });
}

class LogOutEvent extends AuthEvent {}
