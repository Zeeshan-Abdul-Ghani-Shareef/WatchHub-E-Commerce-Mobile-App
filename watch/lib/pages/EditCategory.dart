import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({super.key, required this.title});

  final String title;

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  String name = "";
  String desc = "";
  String msg = "";

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _EditCategory();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your Product has been updated',
          style: TextStyle(
              fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
        )));
      });
    }
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
                  fontSize: 16,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
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
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      color: kSecondaryColor,
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
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    color: kPrimaryColor,
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
        await Network().postData({"cid": widget.title}, '/getCategorybyID.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        products = res['category'];
      });
    });
    return response;
  }

  Future<http.Response> _EditCategory() async {
    final http.Response response = await Network().postData({
      "name": name,
      "desc": desc,
      "image": "assets/images/shop/product/41.jpg",
      "cid": widget.title
    }, '/EditCategory.php');

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
  void initState() {
    _getProduct1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Update Category"),
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
                    Text('Edit Product of Category id ${widget.title}',
                        style: kTextTheme.bodyMedium),
                    Divider(),
                    Text('${msg}', style: kTextTheme.bodyMedium),
                    Divider(),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Enter Product name"),
                      initialValue: "${products[0]["Name"]}",
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty)
                            name = "";
                          else
                            name = value;
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
                      decoration: InputDecoration(
                          hintText: "Enter Product Description"),
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
                      color: kSecondaryColor,
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
