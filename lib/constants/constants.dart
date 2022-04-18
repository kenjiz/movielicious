import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// Margins
const double kAppWidgetMargin = 30;
const double kAppTitleMargin = 20;
const double kAppHorizontalMargin = 20;
const double kAppVerticalMargin = 50;
const double kAppWidgetListBottomMargin = 15;

// Padding
const double kAppWidgetPadding = 20;

// Box Decorations
const double kAppBorderRadius = 15;

// Palette
/// The app color palette
const Color kDeepPurple = Color(0xFF191a32);
const Color kPurple = Color(0xFF593357);
const Color kPurpleRed = Color(0xFFA14F68);
const Color kOrange = Color(0xFFDD7865);
const Color kLightOrange = Color(0xFFFDB35E);
const Color kYellow = Color(0xFFF9F871);

const Color kPrimaryColor = kDeepPurple;
const Color kSecondaryColor = kPurpleRed;
const Color kAccentColor = kLightOrange;

// Text Styles
/// The app text style
final TextStyle _baseStyle = GoogleFonts.ubuntu(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white.withOpacity(0.9),
  ),
);

// Heading 1
final TextStyle kTextStyleHeading1 = _baseStyle.copyWith(
  fontSize: 28,
  fontWeight: FontWeight.w200,
);

// Heading 2
final TextStyle kTextStyleHeading2 = _baseStyle.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

// Heading 3
final TextStyle kTextStyleAppHeading3 = _baseStyle.copyWith(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// Heading 4
final TextStyle kTextStyleHeading4 = _baseStyle.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

// body
final TextStyle kTextStyleBody1 = _baseStyle;

// body 2
final TextStyle kTextStyleBody2 = _baseStyle.copyWith(fontSize: 14);
