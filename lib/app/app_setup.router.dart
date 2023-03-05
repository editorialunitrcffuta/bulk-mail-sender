// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/screens/admin_auth/admin_login_screen.dart';
import '../ui/screens/form/form_screen.dart';
import '../ui/screens/main_screen/main_screen.dart';
import '../ui/screens/welcome_screen.dart';

class Routes {
  static const String welcomeScreen = '/';
  static const String mainScreen = '/main-screen';
  static const String formScreen = '/registration';
  static const String adminLoginScreen = '/admin-auth';
  static const all = <String>{
    welcomeScreen,
    mainScreen,
    formScreen,
    adminLoginScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.mainScreen, page: MainScreen),
    RouteDef(Routes.formScreen, page: FormScreen),
    RouteDef(Routes.adminLoginScreen, page: AdminLoginScreen),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    // OnBoardingScreen: (data) {
    //   var args = data.getArgs<OnBoardingScreenArguments>(
    //     orElse: () => OnBoardingScreenArguments(),
    //   );
    //   return MaterialPageRoute<dynamic>(
    //     builder: (context) => OnBoardingScreen(key: args.key),
    //     settings: data,
    //   );
    // },
    WelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WelcomeScreen(),
        settings: data,
      );
    },
    MainScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainScreen(),
        settings: data,
      );
    },
    FormScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FormScreen(),
        settings: data,
      );
    },
    AdminLoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AdminLoginScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OnBoardingScreen arguments holder class
class OnBoardingScreenArguments {
  final Key? key;
  OnBoardingScreenArguments({this.key});
}

/// SetupProfileScreen arguments holder class
class SetupProfileScreenArguments {
  final Key? key;
  SetupProfileScreenArguments({this.key});
}
