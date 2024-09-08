// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'test_bloc.dart';

class TestState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus statusStart;
  final TestsModel testsModel;
  final StartTestsModel startTestsModel;
  const TestState({
    this.status = FormzSubmissionStatus.initial,
    this.statusStart = FormzSubmissionStatus.initial,
    this.testsModel = const TestsModel(),
    this.startTestsModel = const StartTestsModel(),
  });

  @override
  List<Object> get props => [
        status,
        startTestsModel,
        testsModel,
        statusStart,
      ];

  TestState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? statusStart,
    TestsModel? testsModel,
    StartTestsModel? startTestsModel,
  }) {
    return TestState(
      status: status ?? this.status,
      statusStart: statusStart ?? this.statusStart,
      testsModel: testsModel ?? this.testsModel,
      startTestsModel: startTestsModel ?? this.startTestsModel,
    );
  }
}
