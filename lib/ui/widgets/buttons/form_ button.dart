import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../responsive.dart';
import '../../screens/main_screen/view_model/main_screen_view_model.dart';
import '../../styles/styles.dart';

class FormButton extends ViewModelWidget<MainScreenViewModel> {
  final VoidCallback onpressed;
  final String textButton;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isBusy;

  const FormButton({
    required this.onpressed,
    required this.textButton,
    this.suffixIcon,
    this.prefixIcon,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context, viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Align(
        alignment: Responsive.isMobile(context)
            ? Alignment.center
            : Alignment.centerLeft,
        child: SizedBox(
          width: Responsive.isMobile(context) ? 95 : 124,
          height: Responsive.isMobile(context) ? 32.56 : 48,
          child: MaterialButton(
            color: Styles.defaultDesignColor,
            onPressed: onpressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(prefixIcon, color: Colors.white),
                  ),
                if (!isBusy)
                  Text(textButton,
                      style: subBodyStyle.copyWith(
                          fontSize: Responsive.isMobile(context) ? 10.2 : 16,
                          color: Styles.defaultLightWhiteColor)),
                if (isBusy) const CircularProgressIndicator(),
                if (suffixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Icon(suffixIcon, color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}