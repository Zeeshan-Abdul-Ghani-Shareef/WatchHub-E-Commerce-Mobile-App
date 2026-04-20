import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key, required this.title});

  final String title;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String title = "";
  String desc = "";
  String price = "";
  String qty = "";
  String cid = "";
  String bid = "";
  String msg = "";

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _addProduct();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your Product has been Added',
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
            title: Text(
              'Information',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Do You want to submit this record',
              style: TextStyle(
                  fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: MaterialButton(
                      onPressed: () {
                        validate();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.grey,
                      minWidth: 80,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.grey,
                    minWidth: 100,
                  ),
                ],
              )
            ],
          );
        });
  }

  
  

  Future<http.Response> _addProduct() async {
    final http.Response response = await Network().postData({
      "title": title,
      "desc": desc,
      "image": "assets/images/shop/product/41.jpg",
      "price": price,
      "qty": qty,
      "cid": bid,
      "bid": bid,
    }, '/AddProduct.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        msg = res['msg'];
      });
    });
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Added Product"),
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
      body: Container(
          height: 900,
          decoration: BoxDecoration(gradient: kModernGradient),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Add Product',
                        style: kTextTheme.bodyMedium),
                    Divider(),
                    Text('${msg}', style: kTextTheme.bodyMedium),
                    Divider(),
                    TextFormField(
                      decoration:
                      InputDecoration(hintText: "Enter Product name"),
                      
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            title = "";
                          else
                            title = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name must be entered";
                        } 
                        return null;
                      },
                    ),
                    Divider(),
                    TextFormField(
                      decoration:
                      InputDecoration(hintText: "Enter Product Description"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            desc = "";
                          else
                            desc = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Description must be entered";
                        } 
                        return null;
                      },
                    ),
                    Divider(),
                    TextFormField(
                      decoration:
                      InputDecoration(hintText: "Enter Product Quantity"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            qty = "";
                          else
                            qty = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Description must be entered";
                        } 
                        return null;
                      },
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter Category"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            cid = "";
                          else
                            cid = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "category must be entered";
                        }
                        return null;
                      },
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter Brand"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            bid = "";
                          else
                            bid = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Brand must be entered";
                        }
                        return null;
                      },
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter Price"),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            price = "";
                          else
                            price = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "price must be entered";
                        }
                        return null;
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
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.grey,
                      minWidth: 300,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
