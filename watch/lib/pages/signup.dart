// pages/signup.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:watch/pages/ProductbyName.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String uname = "";
  String email = "";
  String pwd = "";
  String name = "";
  String msg = "";
  bool _terms = false;

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        //  msg = "Your Registration has been completed please signIn";
        _addemployee();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Your Registration has been completed please signIn',
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

  Future<http.Response> _addemployee() async {
    final http.Response response = await Network().postData({
      "usern": uname,
      "email": email,
      "pass": pwd,
    }, '/addUser.php');

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
                    Text('SignUp', style: kTextTheme.displayMedium),
                    Text(
                      '${msg}',
                      style: TextStyle(
                          fontSize: 20,
                          color: kErrorColor,
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
                        } else if (!RegExp(
                                r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                            .hasMatch(value)) {
                          return "Password must include upper, lower, digit";
                        }
                        return null;
                      },
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
