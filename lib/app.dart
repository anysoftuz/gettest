import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/infrastructure/repo/auth_repo.dart';
import 'package:gettest/l10n/localizations.dart';
import 'package:gettest/presentation/routes/app_routes.dart';
import 'package:gettest/presentation/routes/route_name.dart';
import 'package:gettest/src/assets/themes/theme.dart';
import 'package:gettest/src/settings/local_provider.dart';
import 'package:gettest/src/settings/settings_controller.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(serviceLocator<AuthRepo>())..add(CheckUserEvent()),
      child: ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return ListenableBuilder(
            listenable: serviceLocator<SettingsController>(),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp.router(
                restorationScopeId: 'app',
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Provider.of<LocaleProvider>(context).locale,
                theme: AppTheme.lightTheme(),
                darkTheme: AppTheme.darkTheme(),
                themeMode: serviceLocator<SettingsController>().themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouts.router,
                builder: (context, child) => BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    debugPrint('STATE LISTENER ============> ${state.status}');
                    switch (state.status) {
                      case AuthenticationStatus.unauthenticated:
                        AppRouts.router.pushReplacement(AppRouteName.auth);
                        break;
                      case AuthenticationStatus.authenticated:
                        AppRouts.router.go(AppRouteName.home);
                        break;
                      case AuthenticationStatus.loading:
                      case AuthenticationStatus.cancelLoading:
                        break;
                    }
                  },
                  child: KeyboardDismisser(child: child),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
