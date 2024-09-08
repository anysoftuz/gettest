// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final UserModel userModel;
  final FormzSubmissionStatus statusCode;
  final FormzSubmissionStatus statusMyId;
  const AuthState({
    this.statusCode = FormzSubmissionStatus.initial,
    this.statusMyId = FormzSubmissionStatus.initial,
    this.userModel = const UserModel(),
    this.status = AuthenticationStatus.loading,
  });

  @override
  List<Object?> get props => [
        userModel,
        status,
      ];

  AuthState copyWith({
    AuthenticationStatus? status,
    UserModel? userModel,
    FormzSubmissionStatus? statusCode,
    FormzSubmissionStatus? statusMyId,
  }) {
    return AuthState(
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
      statusCode: statusCode ?? this.statusCode,
      statusMyId: statusMyId ?? this.statusMyId,
    );
  }
}
