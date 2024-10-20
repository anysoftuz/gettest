import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/data/models/auth/send_code_model.dart';
import 'package:gettest/l10n/localizations.dart';
import 'package:gettest/presentation/widgets/w_button.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/utils/log_service.dart';
import 'package:pinput/pinput.dart';

class SmsView extends StatefulWidget {
  final SendCodeModel model;
  final String phone;
  const SmsView({
    super.key,
    required this.model,
    required this.phone,
  });

  @override
  State<SmsView> createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
  TextEditingController controller = TextEditingController();
  ValueNotifier<int> valueNotifier = ValueNotifier(0);
  int error = 0;
  Timer? _timer;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  void initState() {
    valueNotifier.value = widget.model.data.otp.expires;
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (valueNotifier.value > 0) {
          valueNotifier.value--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resendSms() {
    valueNotifier.value = widget.model.data.otp.expires;
    startTimer();
  }

  String formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(1, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.confirm)),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return WButton(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onTap: () {
                context.read<AuthBloc>().add(ExistEvent(
                      code: controller.text,
                      onError: (id) {
                        Log.e("Nima");
                        error = -1;
                        setState(() {});
                        if (id == 0) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            "User ro'yhatda mavjud emas",
                          )));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            "Kiritilgan kod xato",
                          )));
                        }
                      },
                      phone: widget.phone,
                      sessionId: widget.model.data.otp.sessionId,
                    ));
              },
              text: AppLocalizations.of(context)!.confirm,
              isLoading: state.statusCode.isInProgress,
              isDisabled:
                  controller.text.length != widget.model.data.otp.codeLength,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.model.data.otp.message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: green),
                borderRadius: BorderRadius.circular(8),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(234, 239, 243, 1),
                ),
              ),
              errorText: "Kiritilgan kod hato",
              forceErrorState: error != 0,
              controller: controller,
              length: widget.model.data.otp.codeLength,
              onCompleted: (pin) => print(pin),
              onChanged: (value) {
                if (value.length >= widget.model.data.otp.codeLength - 1) {
                  setState(() {});
                }
                if (error != 0) {
                  error = 0;
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                if (value == 0) {
                  return InkWell(
                    onTap: () {
                      resendSms();
                    },
                    child: const Text(
                      'Qayta yuborish',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                  );
                }
                return Text(
                  '${formatDuration(value)} ${AppLocalizations.of(context)!.seconds}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
