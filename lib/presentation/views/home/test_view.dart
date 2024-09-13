import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gettest/application/home/test_bloc.dart';
import 'package:gettest/presentation/routes/route_name.dart';
import 'package:gettest/presentation/views/home/test_info_view.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';
import 'package:gettest/src/assets/themes/context_extension.dart';
import 'package:go_router/go_router.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    context.read<TestBloc>().add(GetTestsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tests"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRouteName.notification);
            },
            icon: AppIcons.notification.svg(color: context.color.white),
          )
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<TestBloc>().add(GetTestsEvent());
          await Future.delayed(const Duration(milliseconds: 3));
        },
        child: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state.status.isInProgress) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  final bloc = context.read<TestBloc>();
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: TestInfoView(
                          test: state.testsModel.data.tests[index],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: borderColor),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.testsModel.data.tests[index].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.testsModel.data.tests[index].description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          AppIcons.test.svg(color: green),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "${state.testsModel.data.tests[index].questionsCount}/${state.testsModel.data.tests[index].totalPoints} resolved, you have passed!",
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              itemCount: state.testsModel.data.tests.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            );
          },
        ),
      ),
    );
  }
}
