import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app_setup.locator.dart';
import '../../core/enums/snackbar_type.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
      backgroundColor: Colors.white,
      textColor: Colors.red,
      mainButtonTextColor: Colors.black,
      messageColor: Colors.red));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.blueAndYellow,
    config: SnackbarConfig(
      backgroundColor: Colors.blueAccent,
      textColor: Colors.yellow,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.greenAndRed,
    config: SnackbarConfig(
      backgroundColor: Colors.white,
      titleColor: Colors.green,
      messageColor: Colors.red,
      borderRadius: 1,
    ),
  );
}
