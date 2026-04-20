// pages/AddtoCart.dart
import 'package:flutter/material.dart';
import 'package:watch/pages/ProductTab.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';
import 'CheqOutProduct.dart';

class AddtoCartPage extends StatefulWidget {
  final Map<String, Map<String, dynamic>> cart;

  AddtoCartPage({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<AddtoCartPage> createState() => _AddtoCartPageState();
}

class _AddtoCartPageState extends State<AddtoCartPage> {
  late List products;

  String msg = "";
  Map<String, Map<String, dynamic>> cart = {};

  Map<String, Map<String, dynamic>> cart2 = {};
  // Add a product to the cart
  void addToCart(Map<String, dynamic> products) {
    setState(() {
      String ProductID = products["ProductID"];

      if (cart.containsKey(ProductID)) {
        cart[ProductID]!['quantity']++;
      } else {
        cart[ProductID] = {
          'Title': products['Title'],
          'Price': double.parse(products['Price'].toString()),
          'quantity': 1
        };
      }
      _addcart(products['Title'], "1", products['Price']);
      msg = "Your product has been add in your cart";
    });
  }

  Future<http.Response> _addcart(String name, String qty, String Price) async {
    final http.Response response = await Network()
        .postData({"pid": name, "qty": qty, "": Price}, '/addtoCart.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        // _employee = res['user'];
        msg = res['msg'];
      });
    });
    return response;
  }

  void appendAddtoCart() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => CheqOutProductPage(cart: cart)));
  }

  void RemoveFromCart(Map<String, dynamic> products) {
    setState(() {
      String ProductID = products["ProductID"];

      if (cart.containsKey(ProductID) && cart[ProductID]!['quantity'] > 1) {
        cart[ProductID]!['quantity']--;
      } else {
        cart.remove(ProductID);
      }

      msg = "Your product has been add in your cart";
    });
  }

  getid(Map<String, dynamic> products) {
    setState(() {
      String pid = products["ProductID"];

      Future<http.Response> _addcart(
        String qty, String Price) async {
        final http.Response response = await Network()
            .postData({"pid": pid, "qty": qty, "Price": Price}, '/addCart.php');

        print('response ---- ${jsonDecode(response.body)}');

        setState(() {
          var res = jsonDecode(response.body);
          setState(() {
            // _employee = res['user'];
            msg = res['msg'];
          });
        });
        return response;
      }
    });
  }

  String calculateTotalAmount() {
    double CTotal = 0;

    cart.forEach((key, value) {
      CTotal += value["Price"] * value["quantity"];
    });

    return CTotal.round().toString();
  }

  String calculateTotalItem() {
    double TItem = 0;

    cart.forEach((key, value) {
      TItem += value["quantity"];
    });

    return TItem.round().toString();
  }

  Future<http.Response> _getProduct1() async {
    final http.Response response =
        await Network().postData({}, '/getProduct.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        products = res['products'];
      });
    });
    return response;
  }

  @override
  void initState() {
    _getProduct1();

    cart = widget.cart;
    //  appendAddtoCart();

    super.initState();
  }

  calpagelogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ProductTabPage(title: "Login Page")));
  }

  calpagesignup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => CheqOutProductPage(cart: cart)));
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
          height: 900,
          decoration: BoxDecoration(gradient: kModernGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('assets/images/slider/5.jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover),
              _rowMain(),
              _rowNew(),
              _productCard(),
            ],
          ),
        ),
      ),
    );
  }

  _productCard() {
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: cart.entries.map((entry) {
        String productId = entry.key;
        var product = entry.value;
        return ListTile(
          title: Text(
              '${product['Title']} x${product['quantity']}  PRICE: ${product['Price']}'),
          subtitle: Text(
              'Rs. ${(product['Price'] * product['quantity']).toStringAsFixed(2)}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  RemoveFromCart(products.firstWhere(
                    (p) => p['ProductID'] == productId,
                  ));
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  addToCart(products.firstWhere(
                    (p) => p['ProductID'] == productId,
                  ));
                },
              ),
            ],
          ),
        );
      }).toList(),
    ));
  }

//-------------Row New ------------------------
  _rowMain() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: calpagelogin,
            child: Text('Continue Shopping', style: kTextTheme.bodyMedium),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: calpagesignup,
            child: Text('Check out', style: kTextTheme.bodyMedium),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 60),
            child: Icon(Icons.video_camera_front)),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Total Item ${calculateTotalItem()}',
              style: kTextTheme.bodyMedium),
        ),
      ],
    );
  }

  _rowNew() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Text('Total Item ${calculateTotalItem()}',
              style: kTextTheme.bodyMedium),
        ),
      ],
    );
  }
}
