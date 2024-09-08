import 'package:flutter/material.dart';
import 'package:gettest/presentation/views/home/test_info_view.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';
import 'package:gettest/utils/enums.dart';
import 'package:gettest/utils/my_function.dart';

class StatusTestIteam extends StatelessWidget {
  const StatusTestIteam({
    super.key,
    required this.widget,
  });

  final TestInfoView widget;

  @override
  Widget build(BuildContext context) {
    switch (MyFunction.statusTest(
      date1: widget.test.startedAt,
      date2: widget.test.finishedAt,
    )) {
      case StatusTest.statr:
        return Expanded(
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
                  "Hi, Rustamjon! Test started. You need to finish the test at",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                widget.test.finishedAtFormatted,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: green,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      case StatusTest.missed:
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.missed.svg(
                height: 64,
                width: 64,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Hi, Rustamjon! Test finished at ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                widget.test.finishedAtFormatted,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: red,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "You missed the test!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      case StatusTest.upcoming:
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.upcoming.svg(
                height: 64,
                width: 64,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Hi, Rustamjon! Test will start at ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                widget.test.startedAtFormatted,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: green,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
    }
  }
}
