// pages/ProductTab.dart
// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watch/pages/AddtoCart.dart';
import 'package:watch/support_class/colors.dart';

import '../pages/mainscreen.dart';
import '../pages/ProductMain.dart';

class ProductTabPage extends StatefulWidget {
  const ProductTabPage({super.key, required this.title});

  final String title;

  @override
  State<ProductTabPage> createState() => _ProductTabPageState();
}

class _ProductTabPageState extends State<ProductTabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          ProductMainPage(title: "Products"),
          MainScreenPage(title: "Main Screen"),
        ]),
        bottomNavigationBar: SafeArea(
            child: TabBar(
                labelColor:kPrimaryColor,
                unselectedLabelColor: kSecondaryColor,
                tabs: [
              Tab(icon: Icon(Icons.shop), text: "Product"),
              Tab(icon: Icon(Icons.home), text: "Login"),
            ])),
      ),
    );
  }
}
