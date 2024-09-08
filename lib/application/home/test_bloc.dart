import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gettest/data/models/home/start_test_model.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/infrastructure/repo/home_repo.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final HomeRepoImpl _repository;
  TestBloc(this._repository) : super(const TestState()) {
    on<GetTestsEvent>((event, emit) async {
      if (state.testsModel.data.tests.isEmpty) {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      }
      final resault = await _repository.getTests();
      if (resault.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          testsModel: resault.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<StartTestEvent>((event, emit) async {
      emit(state.copyWith(statusStart: FormzSubmissionStatus.inProgress));
      final resault = await _repository.getTestStart(event.id);
      if (resault.isRight) {
        emit(state.copyWith(
          statusStart: FormzSubmissionStatus.success,
          startTestsModel: resault.right,
        ));
      } else {
        emit(state.copyWith(statusStart: FormzSubmissionStatus.failure));
      }
    });

    on<FinishTestEvent>((event, emit) async {
      emit(state.copyWith(statusStart: FormzSubmissionStatus.inProgress));
      final resault = await _repository.getTestStart(event.id);
      if (resault.isRight) {
        emit(state.copyWith(
          statusStart: FormzSubmissionStatus.success,
          startTestsModel: resault.right,
        ));
      } else {
        emit(state.copyWith(statusStart: FormzSubmissionStatus.failure));
      }
    });
  }
}
