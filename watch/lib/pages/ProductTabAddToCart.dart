import 'package:flutter/material.dart';

import '../pages/mainscreen.dart';
import '../pages/ProductMain.dart';


class ProductTabAddToCartPage extends StatefulWidget {
  const ProductTabAddToCartPage({super.key, required this.title});

  final String title;

  @override
  State<ProductTabAddToCartPage> createState() =>
      _ProductTabAddToCartPageState();
}

class _ProductTabAddToCartPageState extends State<ProductTabAddToCartPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          //  AddtoCartPage(title: "Main Screen"),
          ProductMainPage(title: "Products"),
          MainScreenPage(title: "Main Screen"),
        ]),
        bottomNavigationBar: SafeArea(
            child: TabBar(tabs: [
          Tab(icon: Icon(Icons.contact_emergency), text: "Cart"),
          Tab(icon: Icon(Icons.home), text: "Product"),
          Tab(icon: Icon(Icons.access_alarm), text: "Login"),
        ])),
      ),
    );
  }
}
