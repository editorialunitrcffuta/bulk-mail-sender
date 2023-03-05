import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color scaffoldBackgroundColor = const Color(0xFFe0efff);
  // static Color defaultRedColor = const Color(0xffff698a);
  static Color defaultYellowColor = const Color(0xFFfedd69);
  static Color defaultBlueColor = const Color(0xff52beff);
  static Color defaultDesignColor = const Color(0xffF26722);
  static Color defaultGreyColor = const Color(0xff77839a);
  static Color defaultLightGreyColor = const Color(0xffa4a4a4);
  static Color defaultLightWhiteColor = const Color(0xFFf2f6fe);
  static Color primaryColor = Colors.deepOrange;
  static Color questionTextColor = Colors.black87;

  static double defaultPadding = 18.0;

  static BorderRadius defaultBorderRadius = BorderRadius.circular(8);
  static const TextStyle defaultTitleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF242731),
  );
  static const TextStyle defaultHeaderText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF242426),
  );
  static const TextStyle defaultInnerText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xFF242426),
  );

  static ScrollbarThemeData scrollbarTheme =
      const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(defaultYellowColor),
    isAlwaysShown: false,
    interactive: true,
  );
}

TextStyle welcomeStyle1 = GoogleFonts.poppins(
    fontSize: 112.52,
    color: Styles.defaultDesignColor,
    fontWeight: FontWeight.w800,
    height: 0.8);
TextStyle welcomeStyle2 = GoogleFonts.poppins(
    fontSize: 112.52,
    color: Styles.defaultLightWhiteColor,
    fontWeight: FontWeight.w500,
    height: 0.8);
TextStyle swipeStyle = GoogleFonts.poppins(
    fontSize: 31,
    color: Styles.defaultLightWhiteColor,
    fontWeight: FontWeight.w400,
    height: 0.8);
TextStyle subBodyStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: Styles.questionTextColor,
    fontWeight: FontWeight.w400,
    height: 1.3);
TextStyle labelStyle = GoogleFonts.poppins(
    fontSize: 14,
    color: Styles.questionTextColor,
    fontWeight: FontWeight.w400,
    height: 1);
TextStyle databaseStyle1 = GoogleFonts.dmSans(
  color: const Color(0xff3F3C40),
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
TextStyle databaseStyle2 = GoogleFonts.dmSans(
  color: const Color(0xff919191),
  fontWeight: FontWeight.w400,
  fontSize: 12,
);
TextStyle databaseStyle3 = GoogleFonts.dmSans(
  color: const Color(0xff3F3C40),
  fontWeight: FontWeight.w400,
  fontSize: 14,
);
TextStyle databaseStyle4 = GoogleFonts.dmSans(
  color: const Color(0xffffffff),
  fontWeight: FontWeight.w400,
  fontSize: 20,
);
TextStyle databaseStyle5 = GoogleFonts.dmSans(
  color: const Color(0xffffffff),
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
TextStyle databaseStyle6 = GoogleFonts.dmSans(
  color: const Color(0xff000000),
  fontWeight: FontWeight.w500,
  fontSize: 20,
);
TextStyle databaseStyle7 = GoogleFonts.dmSans(
  color: const Color(0xff6d6d6d),
  fontWeight: FontWeight.w500,
  fontSize: 20,
);
TextStyle databaseStyle8 = GoogleFonts.dmSans(
  color: const Color(0xff040404),
  fontWeight: FontWeight.w400,
  fontSize: 20,
);
TextStyle databaseStyle9 = GoogleFonts.dmSans(
  color: const Color(0xffff4e02),
  fontWeight: FontWeight.w500,
  fontSize: 20,
);
TextStyle databaseStyle10 = GoogleFonts.dmSans(
  color: const Color(0xff000000),
  fontWeight: FontWeight.w600,
  fontSize: 30,
);
TextStyle databaseStyle11 = GoogleFonts.dmSans(
  color: const Color(0xffcbcbcb),
  fontWeight: FontWeight.w500,
  fontSize: 12,
);

