import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettest/application/home/test_bloc.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/l10n/localizations.dart';
import 'package:gettest/presentation/views/home/start_test_view.dart';
import 'package:gettest/presentation/views/home/widgets/status_test_iteam.dart';
import 'package:gettest/presentation/widgets/w_button.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';
import 'package:gettest/utils/enums.dart';
import 'package:gettest/utils/my_function.dart';

class TestInfoView extends StatefulWidget {
  const TestInfoView({super.key, required this.test});
  final Test test;

  @override
  State<TestInfoView> createState() => _TestInfoViewState();
}

class _TestInfoViewState extends State<TestInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.tests)),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: const BoxDecoration(
            color: white,
            border: Border(top: BorderSide(color: borderColor)),
          ),
          child: WButton(
            onTap: () {
              final bloc = context.read<TestBloc>();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: bloc,
                  child: StartTestView(test: widget.test),
                ),
              ));
            },
            height: 48,
            borderRadius: 8,
            isDisabled: MyFunction.statusTest(
                    date1: widget.test.startedAt,
                    date2: widget.test.finishedAt) !=
                StatusTest.statr,
            text: AppLocalizations.of(context)!.startTest,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StatusTestIteam(widget: widget),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: AppIcons.question.svg(),
                    leadingToTitle: 8,
                    title: Text(
                      AppLocalizations.of(context)!.allQuestions,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: Text(widget.test.questionsCount.toString()),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: AppIcons.test.svg(),
                    leadingToTitle: 8,
                    title: Text(
                      AppLocalizations.of(context)!.allPoints,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: Text(widget.test.totalPoints.toString()),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: AppIcons.passing.svg(),
                    leadingToTitle: 8,
                    title: Text(
                      AppLocalizations.of(context)!.passingScore,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: Text(widget.test.passingScore.toString()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
