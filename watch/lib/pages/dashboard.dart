// pages/DashBoard.dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:watch/pages/AddtoCart.dart';
import 'package:watch/pages/Brand.dart';
import 'package:watch/pages/Category.dart';
import 'package:watch/pages/ProductTab2.dart';
import 'package:watch/pages/ProductTabAddToCart.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'login.dart';
import 'DashBoardgrid.dart';
import 'Products.dart';
import 'ProductTab.dart';
import 'aboutus.dart';
import 'package:watch/pages/Faqs.dart';
import 'CheqOutProduct.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key, required this.title});

  final String title;

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

Map<String, Map<String, dynamic>> cart = {};

class _DashBoardPageState extends State<DashBoardPage> {
  String msg = "";

  calpageDashBoard2() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                DashBoardPage(title: "DashBoard2")));
  }

  calpageLogout() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ProductTabPage(title: "Product")));
  }

  calpageProduct() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => productPage(title: "Product")));
  }

  calpageCat() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => CategoryPage(title: "Category")));
  }

  calpageBrand() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => BrandPage(title: "Brand")));
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sign Up"),
        leading: PopupMenuButton(
          icon: Icon(Icons.menu),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(value: 0, child: Text("Product")),
              PopupMenuItem<int>(value: 1, child: Text("Category")),
              PopupMenuItem<int>(value: 2, child: Text("Brand")),
              PopupMenuItem<int>(value: 4, child: Text("Log Out")),
            ];
          },
          onSelected: (value) {
            if (value == 0) calpageProduct();
            else if (value == 1) calpageCat();
            else if (value == 2) calpageBrand();
            else if (value == 2) calpageLogout();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                msg = "Search Pressed";
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              setState(() {
                msg = "vertical Pressed";
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome ${widget.title}',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Image(
              image: AssetImage('assets/images/slider/3.jpg'),
              fit: BoxFit.cover),
          Divider(),
          Card(
            child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text(' Products', style: kTextTheme.displayLarge),
                subtitle:Text('Product', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageProduct),
          ),
          Card(
            child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text(' Category', style: kTextTheme.displayLarge),
                subtitle:Text('Category', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageCat),
          ),
          Card(
            child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text('Brand', style: kTextTheme.displayLarge),
                subtitle:Text('Brand', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageBrand),
          ),
          Card(
            child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text('Log Out', style: kTextTheme.displayLarge),
                subtitle:Text('Log Out', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageLogout),
          ),
        ],
      ),
    );
  }
}
