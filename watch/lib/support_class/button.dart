import 'package:flutter/material.dart';
import 'colors.dart';

// Elevated Button Theme
final ElevatedButtonThemeData kElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    backgroundColor: kSecondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
);

// Text Button Theme
final TextButtonThemeData kTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: kSecondaryColor, // Use foregroundColor instead of primary
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
);

// Outlined Button Theme
final OutlinedButtonThemeData kOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: kPrimaryColor, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: kPrimaryColor, // This property is optional
    ),
  ),
);
