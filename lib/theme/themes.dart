import 'package:flutter/material.dart';

// Constants
import '../constants/constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  colorScheme: const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: kPrimaryColor,
  textTheme: TextTheme(
    headline1: kTextStyleHeading1,
    headline2: kTextStyleHeading2,
    headline3: kTextStyleAppHeading3,
    headline4: kTextStyleHeading4,
    bodyText1: kTextStyleBody1,
    bodyText2: kTextStyleBody2,
  )
);