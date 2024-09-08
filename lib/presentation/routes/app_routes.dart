import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettest/application/home/test_bloc.dart';
import 'package:gettest/data/models/home/tests_model.dart';
import 'package:gettest/infrastructure/core/service_locator.dart';
import 'package:gettest/infrastructure/repo/home_repo.dart';
import 'package:gettest/presentation/routes/route_name.dart';
import 'package:gettest/presentation/views/auth/auth_view.dart';
import 'package:gettest/presentation/views/error_view.dart';
import 'package:gettest/presentation/views/home/main_view.dart';
import 'package:gettest/presentation/views/home/notification_view.dart';
import 'package:gettest/presentation/views/home/start_test_view.dart';
import 'package:gettest/presentation/views/home/test_info_view.dart';
import 'package:gettest/presentation/views/home/test_view.dart';
import 'package:gettest/presentation/views/profile/edit_profile_view.dart';
import 'package:gettest/presentation/views/profile/identification_view.dart';
import 'package:gettest/presentation/views/profile/lenguage_view.dart';
import 'package:gettest/presentation/views/profile/profile_view.dart';
import 'package:gettest/presentation/views/profile/scan_view.dart';
import 'package:gettest/presentation/views/profile/theme_view.dart';
import 'package:gettest/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRouteName.splash,
    errorBuilder: (context, state) => const ErrorView(),
    routes: [
      GoRoute(
        path: AppRouteName.errorFound,
        builder: (context, state) => const ErrorView(),
      ),
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouteName.notification,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: AppRouteName.auth,
        builder: (context, state) => const AuthView(),
      ),
      mainView,
    ],
  );

  static final mainView = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return BlocProvider(
        create: (context) => TestBloc(serviceLocator<HomeRepoImpl>()),
        child: MainView(navigationShell: navigationShell),
      );
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.home,
            builder: (context, state) => const TestView(),
          ),
          GoRoute(
            path: AppRouteName.testInfo,
            builder: (context, state) =>
                TestInfoView(test: state.extra as Test),
          ),
          GoRoute(
            path: AppRouteName.testStart,
            builder: (context, state) =>
                StartTestView(test: state.extra as Test),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.profile,
            builder: (context, state) => const ProfileView(),
          ),
          GoRoute(
            path: AppRouteName.profileInfo,
            builder: (context, state) => const EditProfileView(),
          ),
          GoRoute(
            path: AppRouteName.scan,
            builder: (context, state) => const ScanView(),
          ),
          GoRoute(
            path: AppRouteName.lenguage,
            builder: (context, state) => const LenguageView(),
          ),
          GoRoute(
            path: AppRouteName.theme,
            builder: (context, state) => const ThemeView(),
          ),
          GoRoute(
            path: AppRouteName.identification,
            builder: (context, state) => const IdentificationView(),
          ),
        ],
      ),
    ],
  );
}
