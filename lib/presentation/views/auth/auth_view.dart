import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/presentation/views/auth/sms_view.dart';
import 'package:gettest/presentation/widgets/custom_text_field.dart';
import 'package:gettest/presentation/widgets/w_button.dart';
import 'package:gettest/utils/formatters.dart';
import 'package:gettest/utils/my_function.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth"),
      ),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return WButton(
              isDisabled: controller.text.length != 19,
              isLoading: state.statusCode.isInProgress,
              margin: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 16),
              onTap: () {
                context.read<AuthBloc>().add(SendCodeEvent(
                      phone: MyFunction.formatPhoneNumber(controller.text),
                      onError: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "Birozdan so'ng qayta urinib ko'ring",
                        )));
                      },
                      onSucces: (model) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SmsView(
                            model: model,
                            phone:
                                MyFunction.formatPhoneNumber(controller.text),
                          ),
                        ));
                      },
                    ));
              },
              text: "Davom etish",
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomTextField(
          hintText: "+998",
          controller: controller,
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            if (value.length >= 18) {
              setState(() {});
            }
          },
          formatter: [Formatters.phoneFormatter],
        ),
      ),
    );
  }
}
