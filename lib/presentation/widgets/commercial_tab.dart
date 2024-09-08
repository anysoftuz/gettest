import 'package:flutter/material.dart';
import 'package:gettest/src/assets/colors/colors.dart';

class CommercialTab extends StatelessWidget {
  const CommercialTab(
      {required this.onTabTap,
      required this.tabController,
      required this.tabLabels,
      super.key});

  final TabController tabController;
  final List<String> tabLabels;
  final ValueChanged<int> onTabTap;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: dark.withOpacity(.08),
            )
          ],
        ),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: gray.withOpacity(.12),
          ),
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TabBar(
            onTap: onTabTap,
            controller: tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
                // Theme.of(context).extension<ThemedColors>()!.whiteToDolphin,
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.04),
                      blurRadius: 1,
                      offset: const Offset(0, 3)),
                  BoxShadow(
                      color: black.withOpacity(0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 3)),
                ]),
            labelPadding: EdgeInsets.zero,
            labelColor: secondary,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            unselectedLabelColor: const Color(0xFF24292F),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            tabs: [
              for (int i = 0; i < tabLabels.length - 1; i++)
                Row(
                  children: [
                    Expanded(child: Tab(text: tabLabels[i])),
                    const VerticalDivider(
                      color: Color(0xFFAFB8C1),
                      thickness: 0.65,
                      width: 0.65,
                      indent: 5,
                      endIndent: 2,
                    )
                  ],
                ),
              Tab(text: tabLabels.last),
            ],
          ),
        ),
      );
}
