import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gettest/presentation/widgets/w_button.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';

class TestResultsView extends StatefulWidget {
  const TestResultsView({super.key});

  @override
  State<TestResultsView> createState() => _TestResultsViewState();
}

class _TestResultsViewState extends State<TestResultsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.close.svg(),
        ),
        title: const Text("Results"),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          decoration: const BoxDecoration(
            color: white,
            border: Border(top: BorderSide(color: borderColor)),
          ),
          child: WButton(
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pop()
                ..pop();
            },
            height: 48,
            borderRadius: 8,
            color: white,
            border: Border.all(color: const Color(0xFFAFB8C1)),
            text: "Back to results",
            textColor: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.save.svg(
                    color: green,
                    height: 64,
                    width: 64,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Congratulations! You have passed the exam!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
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
                    title: const Text(
                      "All questions",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: const Text("15"),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: AppIcons.test.svg(),
                    leadingToTitle: 8,
                    title: const Text(
                      "All points",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: const Text("150"),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: AppIcons.passing.svg(),
                    leadingToTitle: 8,
                    title: const Text(
                      "Passing score",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: const Text("80"),
                  ),
                  const Divider(height: 1),
                  CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: AppIcons.checkVerified.svg(),
                    leadingToTitle: 8,
                    title: const Text(
                      "Your points",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    trailing: const Text("70"),
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
