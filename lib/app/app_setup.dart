import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../core/repos/widows_repo.dart';
import '../core/services/database_service.dart';
import '../ui/screens/admin_auth/admin_login_screen.dart';
import '../ui/screens/form/form_screen.dart';
import '../ui/screens/main_screen/main_screen.dart';
import '../ui/screens/main_screen/view_model/main_screen_view_model.dart';
import '../ui/screens/welcome_screen.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: WelcomeScreen, initial: true),
    MaterialRoute(page: MainScreen),
    MaterialRoute(page: FormScreen),
    MaterialRoute(page: AdminLoginScreen),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: MainScreenViewModel),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: GetUsersListRepo)
  ],
  logger: StackedLogger(),
)
class AppSetup {}
