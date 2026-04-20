import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key, required this.title});

  final String title;

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  calpagelogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => LoginPage(title: "Login Page")));
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
      body: Container(
        height: 600,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contact Us',
              style: TextStyle(
                  fontSize: 48,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Divider(),
            Image(
                image: AssetImage('assets/images/123.jpg'), fit: BoxFit.cover),
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
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.grey,
                  minWidth: 200,
                ),
                Text("   "),
                MaterialButton(
                  onPressed: calpagesignup,
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.grey,
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
