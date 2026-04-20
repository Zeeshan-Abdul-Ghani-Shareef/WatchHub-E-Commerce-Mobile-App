// pages/dashboardmember.dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:watch/pages/AddtoCart.dart';
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

class DashBoardMemberPage extends StatefulWidget {
  const DashBoardMemberPage({super.key, required this.title});

  final String title;

  @override
  State<DashBoardMemberPage> createState() => _DashBoardMemberPageState();
}

Map<String, Map<String, dynamic>> cart = {};

class _DashBoardMemberPageState extends State<DashBoardMemberPage> {
  String msg = "";

  calpageDashBoardMember2() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                DashBoardMemberPage(title: "DashBoardMember2")));
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
            builder: (context) => ProductTab2Page(title: "Product")));
  }

  calpageCheqout() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => AddtoCartPage(cart: cart)));
  }

  calpageFaqs() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => FaqsPage()));
  }
  calpageAbout() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => AboutUsPage(title: 'About')));
  }
  
  calpageContact() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => AboutUsPage(title: 'Contact')));
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
              PopupMenuItem<int>(value: 1, child: Text("Cart")),
              PopupMenuItem<int>(value: 2, child: Text("Faqs")),
              PopupMenuItem<int>(value: 3, child: Text("About")),
              PopupMenuItem<int>(value: 4, child: Text("Log Out")),
            ];
          },
          onSelected: (value) {
            if (value == 0) calpageProduct();
            else if (value == 1) calpageCheqout();
            else if (value == 2) calpageFaqs();
            else if (value == 3) calpageAbout();
            else if (value == 4) calpageLogout();
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
                title: Text(' CheckOut', style: kTextTheme.displayLarge),
                subtitle:Text('CheckOut', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageCheqout),
          ),
          Card(
            child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text('FAQs', style: kTextTheme.displayLarge),
                subtitle:Text('FAQs', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageFaqs),
          ),
          Card(
            child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text('About', style: kTextTheme.displayLarge),
                subtitle:Text('About', style: kTextTheme.displayMedium),
                trailing: Icon(
                  Icons.next_plan,
                  size: 48,
                  color: kPrimaryColor,
                ),
                onTap: calpageAbout),
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
