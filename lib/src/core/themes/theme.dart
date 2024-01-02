import 'package:flutter/material.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';

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
    displayLarge: kTextStyleHeading1,
    displayMedium: kTextStyleHeading2,
    displaySmall: kTextStyleAppHeading3,
    headlineMedium: kTextStyleHeading4,
    bodyLarge: kTextStyleBody1,
    bodyMedium: kTextStyleBody2,
  ),
);
