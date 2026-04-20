// pages/ProductTablogin.dart
import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';

import '../pages/mainscreen.dart';
import '../pages/ProductMain.dart';
import '../pages/login.dart';

class ProductTabLoginPage extends StatefulWidget {
  const ProductTabLoginPage({super.key, required this.title});

  final String title;

  @override
  State<ProductTabLoginPage> createState() => _ProductTabLoginPageState();
}

class _ProductTabLoginPageState extends State<ProductTabLoginPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          LoginPage(title: "login"),
          ProductMainPage(title: "Products"),
          MainScreenPage(title: "Main Screen"),
        ]),
        bottomNavigationBar: SafeArea(
            child: TabBar(
                labelColor: kPrimaryColor,
                unselectedLabelColor: kSecondaryColor,
                tabs: [
              Tab(icon: Icon(Icons.card_membership_outlined), text: "Login"),
              Tab(icon: Icon(Icons.home), text: "Product"),
              Tab(icon: Icon(Icons.access_alarm), text: "Login"),
            ])),
      ),
    );
  }
}
