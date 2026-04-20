// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'signup.dart';
import 'login.dart';
import 'ProductMain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';
import '../model/City.dart';

class CheqOutProductPage extends StatefulWidget {
  final Map<String, Map<String, dynamic>> cart;

  CheqOutProductPage({Key? key, required this.cart}) : super(key: key);

  @override
  State<CheqOutProductPage> createState() => _CheqOutProductPageState();
}

class _CheqOutProductPageState extends State<CheqOutProductPage> {
  String uname = "";
  String email = "";
  String pwd = "";
  String address = "";
  String gender = "Male";
  bool _terms = false;
  String msg = "";
  String? _selectedValue;

  //dropdown city
  String cityName = "";
  int cityId = 1;

  City? _selectedCity;

  List<City> cityList = [
    City(1, "Karachi"),
    City(2, "Lahore"),
    City(3, "Islamabad"),
  ];

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _addemployee();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your product has been add in your cart',
          style: TextStyle(
              fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
        )));
      });
    }
  }

  calpageLogout() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => LoginPage(title: "Login")));
  }

  void showConDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Information', style: kTextTheme.displayLarge),
            content: Text('Do You want to submit this record',
                style: kTextTheme.displayMedium),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        validate();
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok', style: kTextTheme.bodyMedium),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel', style: kTextTheme.bodyMedium),
                  ),
                ],
              )
            ],
          );
        });
  }

  //api calling function

  Future<http.Response> _addemployee() async {
    final http.Response response = await Network().postData({
      "name": uname,
      "email": email,
      "pwd": pwd,
      "address": address,
      "city": cityName
    }, '/addEmployee.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        msg = res['msg'];
      });
    });
    return response;
  }

  late List products;

  Map<String, Map<String, dynamic>> cart = {};

  Map<String, Map<String, dynamic>> cart2 = {};
  void CheqOutProduct(Map<String, dynamic> products) {
    setState(() {
      String ProductID = products["ProductID"];

      if (cart.containsKey(ProductID)) {
        cart[ProductID]!['quantity']++;
      } else {
        cart[ProductID] = {
          'Title': products['Title'],
          'price': double.parse(products['Price'].toString()),
          'quantity': 1
        };
      }
      _addcart(products['Title'], "1", products['Price']);
      msg = "Your product has been add in your cart";
    });
  }

  Future<http.Response> _addcart(String name, String qty, String price) async {
    final http.Response response = await Network().postData(
        {"name": name, "qty": qty, "uprice": price}, '/CheqOutProduct.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        msg = res['msg'];
      });
    });
    return response;
  }

  void appendCheqOutProduct() {
    for (final item in cart.values) {
      _addcart(item['Title'], "2", item['price']);
    }

    setState(() {
      msg = "Your Order has been placed";
    });
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

  String calculateTotalAmount() {
    double CTotal = 0;

    cart.forEach((key, value) {
      CTotal += value["price"] * value["quantity"];
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
        products = res['product'];
      });
    });
    return response;
  }

  @override
  void initState() {
    _getProduct1();

    cart = widget.cart;
    //  appendCheqOutProduct();

    super.initState();
  }

  calpagelogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ProductMainPage(title: "Login Page")));
  }

  calpagesignup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => SignUpPage(title: "SignUp Page")));
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
          height: 1600,
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
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 0),
                child: _productCard(),
              ),

              _deladdress(),

              // _deladdress()
            ],
          ),
        ),
      ),
    );
  }

  _deladdress() {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Delivery Address',
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              Text(
                '${msg}',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter user name"),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty)
                      uname = "";
                    else
                      uname = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "User Name must be entered";
                  } else if (RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                    return "User Name can not be contain number";
                  }
                  return null;
                },
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Email"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty)
                      email = "";
                    else
                      email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email must be entered";
                  }
                  return null;
                },
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter password"),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty)
                      pwd = "";
                    else
                      pwd = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password must be entered";
                  } else if (value.length < 6) {
                    return "Password must be 6 charachter long";
                  } else if (!RegExp(r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                      .hasMatch(value)) {
                    return "Password must include upper, lower, digit";
                  }
                  return null;
                },
              ),
              Divider(),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Address"),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty)
                      address = "";
                    else
                      address = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Address must be entered";
                  }
                  return null;
                },
              ),
              Divider(),
              Row(
                children: [
                  Radio<String>(
                    value: "Male",
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                        gender = _selectedValue.toString();
                      });
                    },
                  ),
                  Text("Male"),
                  Radio<String>(
                    value: "FeMale",
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                        gender = _selectedValue.toString();
                      });
                    },
                  ),
                  Text("Fe Male"),
                ],
              ),
              Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: DropdownButton<City>(
                  hint: Text(
                    'Please Select City',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 20,
                  style: TextStyle(color: kPrimaryColor),
                  value: _selectedCity,
                  onChanged: (City? value) {
                    setState(() {
                      _selectedCity = value;
                      cityId = _selectedCity!.id;
                      cityName = _selectedCity!.name;
                    });
                  },
                  items: cityList.map<DropdownMenuItem<City>>((City city) {
                    return DropdownMenuItem<City>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                ),
              ),
              Divider(),
              CheckboxListTile(
                title: Text("Accept Terms and condition"),
                value: _terms,
                onChanged: (bool? value) {
                  setState(() {
                    _terms = value!;
                  });
                },
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  showConDialog(context);
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 22,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
                color: kPrimaryColor,
                minWidth: 300,
              ),
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
                  CheqOutProduct(products.firstWhere(
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
            onPressed: calpagelogin,
            child: Text('Check out', style: kTextTheme.bodyMedium),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 80),
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
