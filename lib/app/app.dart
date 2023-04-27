import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import '../core/repos/widows_repo.dart';
import '../ui/setups/setup_snackbar_ui.dart';
import 'app_setup.locator.dart';

class App {
  // static const bool useLocalData = true;
  // final _store = locator<GetUsersListRepo>();

  // Future<void> getMembersData() async {
     // await _store.getMembersData();
     //   print(_store.widowData[0].toJson());
  // }

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCO7vjegAnS7vW_C4EdRFcXpmSKjnD1E3Q",
          authDomain: "ondo-arcp.firebaseapp.com",
          projectId: "ondo-arcp",
          storageBucket: "ondo-arcp.appspot.com",
          messagingSenderId: "451526523160",
          appId: "1:451526523160:web:f6b96d7d3ebee282dd466d",
          measurementId: "G-Z20EBCJTMS"),
    );

    await setupLocator();
    setupSnackbarUi();
  }
}
