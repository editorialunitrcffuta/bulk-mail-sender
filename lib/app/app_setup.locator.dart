// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/repos/widows_repo.dart';
import '../core/services/database_service.dart';
import '../core/services/auth_service.dart';
import '../core/services/firestore_service.dart';
import '../ui/screens/main_screen/view_model/main_screen_view_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => MainScreenViewModel());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => AuthService());
  final widowsRepo = await GetUsersListRepo.getInstance();
  locator.registerSingleton(widowsRepo);
}
