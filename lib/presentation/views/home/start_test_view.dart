import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:formz/formz.dart';
import 'package:gettest/application/home/test_bloc.dart';
import 'package:gettest/data/models/home/quiz_data.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/presentation/views/home/test_results_view.dart';
import 'package:gettest/presentation/views/home/widgets/selection_test_iteam.dart';
import 'package:gettest/presentation/widgets/w_button.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';
import 'package:gettest/utils/log_service.dart';

part 'package:gettest/presentation/views/home/controller/start_test_mixin.dart';

class StartTestView extends StatefulWidget {
  const StartTestView({super.key, required this.test});
  final Test test;

  @override
  State<StartTestView> createState() => _StartTestViewState();
}

class _StartTestViewState extends State<StartTestView> with StartTestMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.close.svg(),
        ),
        title: Text(widget.test.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: AppIcons.info.svg(),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: const BoxDecoration(
            color: white,
            border: Border(top: BorderSide(color: borderColor)),
          ),
          child: Row(
            children: [
              Expanded(
                child: WButton(
                  onTap: () => onTapBack(),
                  height: 48,
                  borderRadius: 8,
                  color: white,
                  border: Border.all(color: const Color(0xFFAFB8C1)),
                  text: "Back",
                  textColor: black,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WButton(
                  onTap: () => onTapContinue(),
                  height: 48,
                  borderRadius: 8,
                  text: "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: BlocConsumer<TestBloc, TestState>(
          listener: (context, state) {
            list = List.generate(
              state.startTestsModel.data.tests.length,
              (index) => QuizDataModel(
                id: state.startTestsModel.data.tests[index].id,
                startedAt: "",
                answeredAt: "",
                answerId: 0,
              ),
            );
          },
          builder: (context, state) {
            if (state.statusStart.isInProgress) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: indexQuset,
                  builder: (context, value, __) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Question ${value + 1} / ${widget.test.questionsCount}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    itemCount: state.startTestsModel.data.tests.length,
                    onPageChanged: (value) {
                      indexQuset.value = value;
                    },
                    itemBuilder: (context, index) => ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, _) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HtmlWidget(
                                state.startTestsModel.data.tests[index].title,
                              ),
                              const SizedBox(height: 16),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, indexAnswer) =>
                                    SelectionTestIteam(
                                  onTap: () {
                                    valueNotifier.value = indexAnswer;
                                  },
                                  testType: getTestId(indexAnswer),
                                  testText: state.startTestsModel.data
                                      .tests[index].answers[indexAnswer].title,
                                  isSelection:
                                      valueNotifier.value == indexAnswer,
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8),
                                itemCount: state.startTestsModel.data
                                    .tests[index].answers.length,
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
