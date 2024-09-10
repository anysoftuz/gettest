import 'package:get_it/get_it.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/infrastructure/apis/auth_datasource.dart';
import 'package:gettest/infrastructure/apis/home_datasource.dart';
import 'package:gettest/infrastructure/core/dio_settings.dart';
import 'package:gettest/infrastructure/repo/auth_repo.dart';
import 'package:gettest/infrastructure/repo/home_repo.dart';
import 'package:gettest/src/settings/settings_controller.dart';
import 'package:gettest/src/settings/settings_service.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
      () => AuthRepo(dataSourcheImpl: AuthDataSourcheImpl()),
    )
    ..registerLazySingleton(
      () => HomeRepoImpl(dataSourcheImpl: HomeDatasourceImpl()),
    )
    ..registerSingleton(SettingsController(SettingsService()))
    ..registerSingleton(AuthBloc(serviceLocator<AuthRepo>()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
