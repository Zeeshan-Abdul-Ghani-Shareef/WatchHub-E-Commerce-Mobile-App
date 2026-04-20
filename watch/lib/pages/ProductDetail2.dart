import 'package:flutter/material.dart';
import 'package:watch/pages/AddtoCart.dart';
import 'package:watch/pages/mainscreen.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class ProductDetail2Page extends StatefulWidget {
  const ProductDetail2Page({super.key, required this.title});

  final String title;

  @override
  State<ProductDetail2Page> createState() => _ProductDetail2PageState();
}

class _ProductDetail2PageState extends State<ProductDetail2Page> {
  late List products;
  late List products2;
  late List category;
  String name = "";

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

  Future<http.Response> _getProduct1() async {
    final http.Response response =
        await Network().postData({"pid": widget.title}, '/getProductbyID.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        products = res['product'];
      });
    });
    return response;
  }

  @override
  void initState() {
    _getProduct1();
    super.initState();
  }

  calpagelogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) =>
                MainScreenPage(title: "Login Page")));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(hintText: "Search Key Word"),
          onChanged: (value) {
            setState(() {});
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          decoration: BoxDecoration(gradient: kModernGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('${products[0]["Image"]}'),
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover),
              _rowMain(),
              _rowNew(),
              Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Product Specification of ${products[0]["Title"]}',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _rowContainer(),
              Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Product Description',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _rowContainer2(),
              Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Related Products',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//-------------Row New ------------------------
  _rowMain() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Product Detail of ${products[0]["Title"]}',
              style: kTextTheme.bodyMedium),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                addToCart(products[0]);
              });
            },
            child: Text('Add to Cart', style: kTextTheme.bodyMedium),
          ),
        ),
      ],
    );
  }

  _rowNew() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Text(
            "Rs. ${products[0]["Price"]}",
            style: TextStyle(
                fontSize: 22, color: kWhiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            "Sale",
            style: TextStyle(
                fontSize: 12,
                color: kSecondaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  _rowContainer() {
    return Container(
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _row1("Category: ", "${products[0]["Category"]}"),
          _row1("Brand: ", "${products[0]["Brand"]}"),
          _row1("Quantity: ", "${products[0]["Quantity"]}"),
        ],
      ),
    );
  }

  _rowContainer2() {
    return Container(
      color: kSecondaryColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${products[0]["Description"]}"),
          ]),
    );
  }
//--------------Row 1-------------------------

  _row1(String title, String action) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title, style: kTextTheme.titleMedium),
          Text(action, style: kTextTheme.titleMedium),
        ],
      ),
    );
  }
//------------Grid -1--------------------------
}
