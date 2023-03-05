import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app_setup.locator.dart';
import '../../../../app/app_setup.router.dart';
import '../../../../core/repos/auth_repo.dart';
import '../../../../core/repos/user_list_repo.dart';

class AdminLoginViewModel extends BaseViewModel {
  final AuthRepo _authRepo = AuthRepo();
  final _navigatorService = locator<NavigationService>();
  bool isHidden = true;

  showPassword() {
    isHidden = !isHidden;
    notifyListeners();
  }

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  login() async{
    setBusy(true);
    notifyListeners();
    _authRepo.login(
      email: emailController.text,
      password: passwordController.text
    );
    _navigatorService.navigateTo(Routes.mainScreen);
    setBusy(false);
    notifyListeners();
  }
}
