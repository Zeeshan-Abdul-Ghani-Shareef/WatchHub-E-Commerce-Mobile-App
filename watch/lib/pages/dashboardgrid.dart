import 'package:flutter/material.dart';
import 'login.dart';


class DashBoardGridPage extends StatefulWidget {
  const DashBoardGridPage({super.key, required this.title});

  final String title;

  @override
  State<DashBoardGridPage> createState() => _DashBoardGridPageState();
}

class _DashBoardGridPageState extends State<DashBoardGridPage> {
  String msg = "";

  calpageLogout() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => LoginPage(title: "Login")));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sign Up"),
        leading: PopupMenuButton(
          icon: Icon(Icons.menu),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(value: 0, child: Text("Calculator")),
              PopupMenuItem<int>(value: 1, child: Text("Mark Sheet")),
              PopupMenuItem<int>(value: 2, child: Text("Log Out")),
            ];
          },

        ),
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
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(8.0),
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 80,
                    color: Colors.amber,
                  ),
                  Divider(),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.production_quantity_limits,
                    size: 80,
                    color: Colors.amber,
                  ),
                  Divider(),
                  Text(
                    'Product',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.abc_outlined,
                    size: 80,
                    color: Colors.amber,
                  ),
                  Divider(),
                  Text(
                    'About',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
             
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.contact_emergency,
                    size: 80,
                    color: Colors.amber,
                  ),
                  Divider(),
                  Text(
                    'Contact',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            
            ),
          )
        ],
      ),
    );
  }
}
