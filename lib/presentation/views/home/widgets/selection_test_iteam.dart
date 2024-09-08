
import 'package:flutter/material.dart';
import 'package:gettest/presentation/widgets/w_scale_animation.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';

class SelectionTestIteam extends StatelessWidget {
  const SelectionTestIteam({
    super.key,
    required this.onTap,
    required this.testType,
    required this.testText,
    required this.isSelection,
  });
  final Function() onTap;
  final String testType;
  final String testText;
  final bool isSelection;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: isSelection ? green : borderColor),
          color: isSelection ? green.withOpacity(.1) : white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            isSelection
                ? AppIcons.checkboxRadioActive.svg(
                    height: 20,
                    width: 20,
                  )
                : AppIcons.checkboxRadio.svg(
                    height: 20,
                    width: 20,
                  ),
            const SizedBox(width: 8),
            Text(
              testType,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                testText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
