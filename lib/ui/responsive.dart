import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  }) : super(key: key);

  static const double mobileBP = 512;
  static const double tabletBP = 1100;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBP;
  }

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBP &&
      MediaQuery.of(context).size.width >= mobileBP;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBP;

  static double kSizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 528; //My design size is 528,
  }

  static double kSizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.height / 500; //My design size is 500,
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print("Screen width ${constraints.maxWidth}");
        if (constraints.maxWidth >= tabletBP) {
          return desktop;
        } else if (constraints.maxWidth > mobileBP &&
            constraints.maxWidth < 1200) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

extension Responsiveness on BuildContext {
  ViewMode get viewMode {
    if (Responsive.isDesktop(this))
      return ViewMode.desktop;
    else if (Responsive.isTablet(this)) return ViewMode.tablet;
    return ViewMode.mobile;
  }

  T? resValues<T>(T? desktop, T? tablet, T? mobile) {
    return viewMode == ViewMode.desktop
        ? desktop
        : (viewMode == ViewMode.tablet ? tablet : mobile);
  }
}

enum ViewMode {
  desktop,
  tablet,
  mobile,
}
