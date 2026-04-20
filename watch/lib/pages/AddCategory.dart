// pages/AddCategory.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:watch/pages/ProductbyName.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key, required this.title});

  final String title;

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  String name = "";
  String desc = "";
  String msg = "";


  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _addcategory();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Your Category has been Added',
              style: kTextTheme.bodyMedium),
        ));
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
            title: Text('Information', style: kTextTheme.bodyMedium),
            content: Text('Do You want to submit this record',
                style: kTextTheme.bodyMedium),
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

  Future<http.Response> _addcategory() async {
    final http.Response response = await Network().postData({
      "name": name,
      "desc": desc,
      "image": "assets/images/categories/men-watch.jpg",
    }, '/addCategory.php');

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
          onPressed: () {
            setState(() {});
          },
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
                    Text('AddCategory', style: kTextTheme.displayMedium),
                    Text(
                      '${msg}',
                      style: TextStyle(
                          fontSize: 20,
                          color: kErrorColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter Category Name"),
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
                          return "User Name must be entered";
                        } 
                        return null;
                      },
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Enter Description"),
                      keyboardType: TextInputType.emailAddress,
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
                          return "Email must be entered";
                        }
                        return null;
                      },
                    ),
                    Divider(),                    
                    ElevatedButton(
                      onPressed: () {
                        showConDialog(context);
                      },
                      child: Text('Submit', style: kTextTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
