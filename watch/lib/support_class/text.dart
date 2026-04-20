import 'package:flutter/material.dart';
import 'colors.dart';

TextTheme kTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: kPrimaryColor,
  ),
  displayMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: kSecondaryColor,
  ),
  displaySmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: kErrorColor,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: kWhiteColor,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: kWhiteColor.withOpacity(0.8),
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: kWhiteColor.withOpacity(0.6),
  ),
  titleLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: kPrimaryColor
    ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: kContentColor
    )
);
