import 'package:flutter/material.dart';
import 'package:gettest/infrastructure/repo/storage_repository.dart';
import 'package:gettest/l10n/localizations.dart';
import 'package:gettest/src/assets/constants/storage_keys.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale(
    StorageRepository.getString(
      StorageKeys.LANGUAGE,
      defValue: 'ru',
    ),
  );
  Locale get locale => _locale;
  void setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    await StorageRepository.putString(
      StorageKeys.LANGUAGE,
      locale.languageCode,
    );
    notifyListeners();
  }
}
