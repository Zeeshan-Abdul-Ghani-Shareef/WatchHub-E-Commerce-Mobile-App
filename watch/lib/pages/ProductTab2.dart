// pages/ProductTab2.dart
// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watch/pages/CheqOutProduct.dart';
import 'package:watch/pages/ProductbyCat.dart';
import 'package:watch/pages/dashboardmember.dart';
import 'package:watch/pages/productbyBrand.dart';
import 'package:watch/support_class/colors.dart';

import '../pages/mainscreen.dart';
import '../pages/ProductMain2.dart';

class ProductTab2Page extends StatefulWidget {
  const ProductTab2Page({super.key, required this.title});

  final String title;

  @override
  State<ProductTab2Page> createState() => _ProductTab2PageState();
}


class _ProductTab2PageState extends State<ProductTab2Page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          ProductMain2Page(title: "Products"),
          productbyCatPage(title: "Products"),
          productbyBrandPage(title: "Products"),
        ]),
        bottomNavigationBar: SafeArea(
            child: TabBar(
                labelColor:kPrimaryColor,
                unselectedLabelColor: kSecondaryColor,
                tabs: [
              Tab(icon: Icon(Icons.shop), text: "Product"),
              Tab(icon: Icon(Icons.shop), text: "Categories"),
              Tab(icon: Icon(Icons.shop), text: "Brand"),
            ])),
      ),
    );
  }
}
