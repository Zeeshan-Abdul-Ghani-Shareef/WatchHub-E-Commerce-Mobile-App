// pages/login.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:watch/pages/ProductbyName.dart';
import 'package:watch/pages/dashboardmember.dart';
import 'package:watch/services/NetworkHelper.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String msg = "";
  String pwd = "";
  String uname = "";
  String name = "";

  void validate() {
    setState(() {
      if (uname.isEmpty) {
        msg = "Username must be entered.";
      } else if (pwd.isEmpty) {
        msg = "Password must be entered.";
      } else {
        _authLogin();
      }
    });
  }

  Future<void> _authLogin() async {
    try {
      final response = await Network()
          .postData({"email": uname, "pass": pwd}, '/authlogin.php');
      final Map<String, dynamic> res = jsonDecode(response.body);

      setState(() {
        if (res['success'] == 1) {
          msg = "Login successful.";
          String role = res['Role'];

          // Navigate based on role
          if (role == "admin") {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => DashBoardPage(title: uname),
              ),
            );
          } else if (role == "user") {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => DashBoardMemberPage(title: uname),
              ),
            );
          } else {
            msg = "Role not recognized.";
          }
        } else {
          msg = res['msg'];
        }
      });
    } catch (error) {
      setState(() {
        msg = "An error occurred: $error";
      });
    }
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
        decoration: BoxDecoration(
          gradient: kModernGradient,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Log In', style: kTextTheme.displayMedium),
                const SizedBox(height: 10),
                Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 18,
                    color: kErrorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter username",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => uname = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => pwd = value,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: validate,
                  child: Text('Submit', style: kTextTheme.bodyMedium),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
