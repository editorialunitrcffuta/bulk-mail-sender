import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.dart';
import 'app/app_setup.router.dart';
import 'ui/styles/styles.dart';

void main() async {
  await App.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bulk Mail Sender",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.welcomeScreen,
    );
  }
}