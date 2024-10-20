import 'package:flutter/material.dart';
import 'package:gettest/l10n/localizations.dart';
import 'package:gettest/presentation/views/profile/theme_view.dart';
import 'package:gettest/src/assets/images.dart';
import 'package:gettest/src/settings/local_provider.dart';
import 'package:provider/provider.dart';

class LenguageView extends StatefulWidget {
  const LenguageView({super.key});

  @override
  State<LenguageView> createState() => _LenguageViewState();
}

class _LenguageViewState extends State<LenguageView> {
  ValueNotifier<int> selectIndex = ValueNotifier(0);
  @override
  void initState() {
    if (Provider.of<LocaleProvider>(context, listen: false).locale ==
        const Locale('ru')) {
      selectIndex.value = 2;
    } else if (Provider.of<LocaleProvider>(context, listen: false).locale ==
        const Locale('en')) {
      selectIndex.value = 1;
    } else {
      selectIndex.value = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.lenguage)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder(
          valueListenable: selectIndex,
          builder: (context, value, __) {
            return Column(
              children: [
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 0,
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppImages.uzb.imgAsset(),
                  ),
                  title: 'O’zbekcha',
                  onTap: () {
                    Provider.of<LocaleProvider>(context, listen: false)
                        .setLocale(AppLocalizations.supportedLocales[2]);
                  },
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 2,
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppImages.ru.imgAsset(),
                  ),
                  title: 'Русский',
                  onTap: () {
                    Provider.of<LocaleProvider>(context, listen: false)
                        .setLocale(AppLocalizations.supportedLocales[1]);
                  },
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 1,
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppImages.eng.imgAsset(),
                  ),
                  title: 'English',
                  onTap: () {
                    Provider.of<LocaleProvider>(context, listen: false)
                        .setLocale(AppLocalizations.supportedLocales[0]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
