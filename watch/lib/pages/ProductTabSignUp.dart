// pages/ProductTabSignUp.dart
import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';

import '../pages/mainscreen.dart';
import '../pages/ProductMain.dart';
import '../pages/signup.dart';

class ProductTabSignUpPage extends StatefulWidget {
  const ProductTabSignUpPage({super.key, required this.title});

  final String title;

  @override
  State<ProductTabSignUpPage> createState() => _ProductTabSignUpPageState();
}

class _ProductTabSignUpPageState extends State<ProductTabSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          SignUpPage(title: "SignUP"),
          ProductMainPage(title: "Products"),
          MainScreenPage(title: "Main Screen"),
        ]),
        bottomNavigationBar: SafeArea(
            child: TabBar(
                labelColor: kPrimaryColor,
                unselectedLabelColor: kSecondaryColor,
                tabs: [
              Tab(icon: Icon(Icons.home), text: "SignUp"),
              Tab(icon: Icon(Icons.home), text: "Product"),
              Tab(icon: Icon(Icons.access_alarm), text: "Login"),
            ])),
      ),
    );
  }
}
