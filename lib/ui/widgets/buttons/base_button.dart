import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../styles/styles.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback onPress;
  final String textButton;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isBusy;

  const BaseButton({
    Key? key,
    required this.onPress,
    required this.textButton,
    this.suffixIcon,
    this.prefixIcon,
    this.isBusy = false,
    this.textStyle, this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 4, right: 4, bottom: 30),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          // width: Responsive.isMobile(context) ? 95 : 124,
          height: Responsive.isMobile(context) ? 32.56 : 48,
          child: MaterialButton(
            color: buttonColor?? Styles.defaultDesignColor,
            onPressed: onPress,
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
                      style: textStyle ??
                          subBodyStyle.copyWith(
                              fontSize:
                                  Responsive.isMobile(context) ? 10.2 : 16,
                              color: Styles.defaultLightWhiteColor)),
                if (isBusy) const CircularProgressIndicator(),
                if (suffixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
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
