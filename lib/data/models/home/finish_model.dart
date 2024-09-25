import 'package:gettest/data/models/home/quiz_data.dart';

class FinishModel {
  final int id;
  final int sessionId;
  final List<QuizDataModel> list;

  FinishModel({
    required this.id,
    required this.sessionId,
    required this.list,
  });
}
