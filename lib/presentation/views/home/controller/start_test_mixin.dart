part of 'package:gettest/presentation/views/home/start_test_view.dart';

mixin StartTestMixin on State<StartTestView> {
  ValueNotifier<int> valueNotifier = ValueNotifier(-1);
  PageController controller = PageController();
  ValueNotifier<int> indexQuset = ValueNotifier(0);
  List<QuizDataModel> list = [];

  @override
  void initState() {
    context.read<TestBloc>().add(StartTestEvent(id: widget.test.id));
    super.initState();
  }

  void onTapContinue() {
    if (indexQuset.value + 1 == widget.test.questionsCount) {
      context.read<TestBloc>().add(FinishTestEvent(
            model: FinishModel(
              id: widget.test.id,
              sessionId: context
                  .read<TestBloc>()
                  .state
                  .startTestsModel
                  .data
                  .testSessionId,
              list: list,
            ),
            onSucces: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TestResultsView(),
              ));
              list.map((e) {
                Log.e(e.answeredAt);
                Log.e(e.answerId);
              });
            },
          ));
    } else {
      controller.animateToPage(
        controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      list[indexQuset.value].answeredAt = DateTime.now().toString();
      list[indexQuset.value].answerId = valueNotifier.value;
    }
  }

  void onTapBack() {
    if (indexQuset.value != 0) {
      controller.animateToPage(
        controller.page!.toInt() - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  String getTestId(int index) {
    switch (index) {
      case 0:
        return "A:";
      case 1:
        return "B:";
      case 2:
        return "C:";
      case 3:
        return "D:";
      case 4:
        return "E:";
      case 5:
        return "F:";
      case 6:
        return "G:";
      case 7:
        return "H:";
      case 8:
        return "I:";
      case 9:
        return "J:";
      case 10:
        return "K:";
      default:
        return "W:";
    }
  }
}
