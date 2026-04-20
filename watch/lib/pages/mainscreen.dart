// pages/mainscreen.dart
import 'package:flutter/material.dart';
import 'package:watch/pages/ProductTablogin.dart';
import 'package:watch/support_class/colors.dart';
import 'productTabSignUp.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key, required this.title});

  final String title;

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  calpagelogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ProductTabLoginPage(title: "Login Page")));
  }

  calpagesignup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ProductTabSignUpPage(title: "SignUp Page")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        decoration: BoxDecoration(gradient: kModernGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to',
              style: TextStyle(
                  fontSize: 38,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
            Divider(),
            Image(
                image: AssetImage('assets/logos/watch-hub-dark.png'),
                fit: BoxFit.cover),
            Divider(),
            Row(
              children: [
                Text("            "),
                MaterialButton(
                  onPressed: calpagelogin,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 22,
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  color: kSecondaryColor,
                  minWidth: 200,
                ),
                Text("   "),
                MaterialButton(
                  onPressed: calpagesignup,
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                        fontSize: 22,
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  color: kSecondaryColor,
                  minWidth: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
