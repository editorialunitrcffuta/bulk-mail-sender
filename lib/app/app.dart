import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import '../core/repos/widows_repo.dart';
import '../ui/setups/setup_snackbar_ui.dart';
import 'app_setup.locator.dart';

class App {
  static const bool useLocalData = true;
  final _store = locator<WidowsRepo>();
  // static final Future<FirebaseApp> firebaseInitializer = Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyBze7eJYma3PqLk_r89y501jr7NjrPGHGI",
  //     authDomain: "ondo-widows-f2964.firebaseapp.com",
  //     projectId: "ondo-widows-f2964",
  //     storageBucket: "ondo-widows-f2964.appspot.com",
  //     messagingSenderId: "1036686037634",
  //     appId: "1:1036686037634:web:80d8865370732e201c9a9b",
  //     databaseURL: "https://milan-29557.firebaseio.com",
  //     // measurementId: "G-QX02MKQW53"
  //   ),
  // );

  Future<void> getWidowsData() async {
    await _store.getWidowsData();
    print(_store.widowData[0].toJson());
  }

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
