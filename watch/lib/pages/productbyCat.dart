// pages/productbyCat.dart
// ignore_for_file: unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:watch/pages/dashboardmember.dart';
import 'dart:convert';
import '../services/NetworkHelper.dart';
import 'ProductbyName.dart';
import 'ProductbyCat.dart';
import 'AddtoCart.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'package:watch/support_class/button.dart';

class productbyCatPage extends StatefulWidget {
  const productbyCatPage({super.key, required this.title});

  final String title;

  @override
  State<productbyCatPage> createState() => _productbyCatPageState();
}

class _productbyCatPageState extends State<productbyCatPage> {
  late List products;
  late List category;
  bool isWishlisted = false;
  String name = "";
  String msg = "";

  Map<String, Map<String, dynamic>> cart = {};

  void addToCart(Map<String, dynamic> products) {
    setState(() {
      String productId = products["ProductID"];

      if (cart.containsKey(productId)) {
        cart[productId]!['quantity']++;
      } else {
        cart[productId] = {
          'Title': products['Title'],
          'Price': double.parse(products['Price'].toString()),
          'quantity': 1
        };
      }

      //  msg = "Your product has been add in your cart";
      Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => AddtoCartPage(cart: cart)));
    });
  }

  void showShoppingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Shopping Cart', style: kTextTheme.displayMedium),
            content: _MyCart(),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) =>
                                    AddtoCartPage(cart: cart)));
                      },
                      child: Text('CheckOut', style: kTextTheme.bodyMedium),
                    ),
                  ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok', style: kTextTheme.bodyMedium),
                  ),
                ],
              )
            ],
          );
        });
  }

  @override
  void initState() {
    _getProduct1();
    _getCategory();
    super.initState();
  }



  Future<http.Response> _getProduct1() async {
    final http.Response response = await Network()
        .postData({"Catid": widget.title}, '/getProductbyCat.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        products = res['products'];
      });
    });
    return response;
  }

  Future<http.Response> _getCategory() async {
    final http.Response response =
        await Network().postData({}, '/getCategory.php');
    setState(() {
      category = jsonDecode(response.body)['categories'];
    });
    return response;
  }

calpageDashBoardMember2() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                DashBoardMemberPage(title: "DashBoardMember2")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(hintText: "Search Key Word"),
          onChanged: (value) {
            setState(() {
              if (value.isEmpty)
                name = "";
              else
                name = value;
            });
          },
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: calpageDashBoardMember2,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => productbyNamePage(title: name)));
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              setState(() {
                showShoppingDialog(context);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          decoration: BoxDecoration(gradient: kModernGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _row2(),
              _row1("Categories ", "  See More"),
              categoryItems(),
              _row1("Flash Sale, New Products", "9-9 Shop More"),
              _grid(2),
            ],
          ),
        ),
      ),
    );
  }
//-------------Row 2 ------------------------

  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>
                          productbyCatPage(title: category[index]["CatID"])));
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(category[index]["Image"]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category[index]["Name"],
                    style: kTextTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: kWhiteColor,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  _MyCart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: cart.entries.map((entry) {
        String productId = entry.key;
        var product = entry.value;
        return ListTile(
          title: Text(
              '${product['Title']} x${product['quantity']} ${product['Price']}'),
          subtitle: Text(
              'Rs. ${(product['Price'] * product['quantity']).toStringAsFixed(2)}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    addToCart(products.firstWhere(
                      (p) => p['ProductID'] == productId,
                    ));
                  }),
            ],
          ),
        );
      }).toList(),
    );
  }

  _row2() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
          padding: EdgeInsets.all(6.0),
          child: Text("WatchHub", style: kTextTheme.displayMedium)),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => AddtoCartPage(cart: cart)));
        },
        child: Text('Cart', style: kTextTheme.bodyLarge),
      ),
    ]);
  }

//--------------Row 1-------------------------

  _row1(String title, String action) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: kTextTheme.displayMedium),
          Text(action, style: kTextTheme.bodyMedium),
        ],
      ),
    );
  }
//------------Grid -1--------------------------

  _grid(int c) {
    return Expanded(
        child: GridView.count(
      crossAxisCount: c,
      padding: EdgeInsets.all(8.0),
      children: [
        for (final item in products) ...[
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                height: 700,
                decoration: BoxDecoration(gradient: kReverseGradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                          image: AssetImage('${item["Image"]}'),
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain),
                    ),
                    Text('${item["Title"]}', style: kTextTheme.bodyLarge),
                    Text('Rs. ${item["Price"]}', style: kTextTheme.bodyLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              addToCart(item);
                            });
                          },
                          child:
                              Text('Add to Cart', style: kTextTheme.bodyMedium),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isWishlisted = !isWishlisted;
                                // Toggle wishlist state
                                
                              });
                            },
                            child: Icon(
                              // ignore: dead_code
                              isWishlisted
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              // ignore: dead_code
                              color: isWishlisted ? kErrorColor : kWhiteColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {

              },
            ),
          ),
        ],
      ],
    ));
  }
}
