// main.dart
import 'package:flutter/material.dart';
import 'package:watch/pages/ProductTab.dart';
import 'package:watch/support_class/button.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kWhiteColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: kSecondaryColor,
        ),
        textTheme: kTextTheme,
        elevatedButtonTheme: kElevatedButtonTheme,
        textButtonTheme: kTextButtonTheme,
        outlinedButtonTheme: kOutlinedButtonTheme,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: kWhiteColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          titleTextStyle:
              kTextTheme.displayMedium?.copyWith(color: kWhiteColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductTabPage(title: 'Product Main'),
    );
  }
}
