import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/infrastructure/repo/auth_repo.dart';
import 'package:gettest/presentation/routes/app_routes.dart';
import 'package:gettest/presentation/routes/route_name.dart';
import 'package:gettest/src/assets/colors/colors.dart';

import 'src/settings/settings_controller.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(serviceLocator<AuthRepo>())..add(CheckUserEvent()),
      child: ListenableBuilder(
        listenable: widget.settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(
              colorSchemeSeed: green,
              scaffoldBackgroundColor: white,
              appBarTheme: const AppBarTheme(
                backgroundColor: white,
                shadowColor: white,
                surfaceTintColor: white,
                centerTitle: true,
                elevation: 1,
              ),
              dividerTheme: const DividerThemeData(color: Color(0xFFEAEEF2)),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: widget.settingsController.themeMode,
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
      ),
    );
  }
}
