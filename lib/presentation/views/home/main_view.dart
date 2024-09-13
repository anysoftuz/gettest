import 'package:flutter/material.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';
import 'package:gettest/src/assets/themes/context_extension.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        selectedItemColor: green,
        unselectedItemColor: context.color.white.withOpacity(.5),
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.test.svg(color: context.color.white.withOpacity(.5)),
            activeIcon: AppIcons.test.svg(color: green),
            label: "Tests",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.profile
                .svg(color: context.color.white.withOpacity(.5)),
            activeIcon: AppIcons.profile.svg(color: green),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
