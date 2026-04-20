import 'package:flutter/material.dart';

// Core Colors
const kContentColor = Color.fromARGB(255, 146, 146, 146);
const kWhiteColor = Color.fromARGB(255, 255, 255, 255);
const kPrimaryColor = Color.fromARGB(255, 3, 175, 255);
const kSecondaryColor = Color.fromARGB(255, 7, 64, 250);
const kErrorColor = Color.fromARGB(255, 255, 148, 148);
const kSuccessColor = Color.fromARGB(255, 220, 255, 175);
const kHighlightColor = Color.fromARGB(255, 255, 196, 0);

// Gradients
final LinearGradient kModernGradient = LinearGradient(
  colors: [kWhiteColor, kPrimaryColor],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final LinearGradient kReverseGradient = LinearGradient(
  colors: [kSecondaryColor, kPrimaryColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
