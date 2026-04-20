import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key, required this.title});

  final String title;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  String title = "";
  String desc = "";
  String image = "assets/images/shop/product/41.jpg";
  String price = "";
  String qty = "";
  String cid = "";
  String bid = "";
  String msg = "";

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _EditProduct();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your Product has been updated',
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

  //api calling function
  late List products;

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

  Future<http.Response> _EditProduct() async {
    final http.Response response = await Network().postData({
      "title": title,
      "desc": desc,
      "image": "assets/images/shop/product/41.jpg",
      "price": price,
      "qty": qty,
      "cid": bid,
      "bid": bid,
      "pid": widget.title
    }, '/editProduct.php');

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

  @override
  void initState() {
    _getProduct1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Update Product"),
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
                    Text('Edit Product of product id ${widget.title}',
                        style: kTextTheme.bodyMedium),
                    Divider(),
                    Text('${msg}', style: kTextTheme.bodyMedium),
                    Divider(),
                    TextFormField(
                      decoration:
                      InputDecoration(hintText: "Enter Product name"),
                      initialValue: "${products[0]["Title"]}",
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
                    TextFormField(
                      decoration:
                      InputDecoration(hintText: "Enter Product Description"),
                      initialValue: "${products[0]["Description"]}",
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
                      decoration: InputDecoration(hintText: "Enter Category"),
                      initialValue: "${products[0]["CategoryID"]}",
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
                      initialValue: "${products[0]["BrandID"]}",
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
                      decoration:
                          InputDecoration(hintText: "Enter Quamtity"),
                      initialValue: "${products[0]["Quantity"]}",
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
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
                      decoration: InputDecoration(hintText: "Enter Price"),
                      initialValue: "${products[0]["buyPrice"]}",
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
