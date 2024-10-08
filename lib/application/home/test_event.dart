part of 'test_bloc.dart';

sealed class TestEvent {}

class GetTestsEvent extends TestEvent {
  final bool getMore;

  GetTestsEvent({this.getMore = false});
}

class StartTestEvent extends TestEvent {
  final int id;

  StartTestEvent({required this.id});
}

class FinishTestEvent extends TestEvent {
  final FinishModel model;
  final VoidCallback onSucces;

  FinishTestEvent({
    required this.model,
    required this.onSucces,
  });
}
