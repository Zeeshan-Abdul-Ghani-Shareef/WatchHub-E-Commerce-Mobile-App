import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';
import 'dart:convert';
import '../services/NetworkHelper.dart';
import 'AddProduct.dart';
import 'EditProduct.dart';

class productPage extends StatefulWidget {
  const productPage({super.key, required this.title});

  final String title;

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  calpagelogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => AddProductPage(title: "Product Page")));
  }



  late List products;
  String name = "";
  String msg = "";
  String pid = "";

     Future<http.Response> _getProduct1() async {
    final http.Response response =
        await Network().postData({}, '/getProduct.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        products = res['products'];
      });
    });
    return response;
  }

  Future<http.Response> _deleteProduct() async {
    final http.Response response =
        await Network().postData({"pid": pid}, '/deleteProduct.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        msg = res['msg'];
      });
    });
    return response;
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
              'Do You want to delete this record',
              style: TextStyle(
                  fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: MaterialButton(
                      onPressed: () {
                        _deleteProduct();
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) =>
                                    productPage(title: name)));
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontSize: 22,
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      color: kPrimaryColor,
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

  @override
  void initState() {
    _getProduct1();

    super.initState();
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => productPage(title: name)));
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
          height: 900,
          decoration: BoxDecoration(
              gradient: kModernGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('assets/images/slider/5.jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover),
              _row1("Product Detail of", "${widget.title}"),
              _rowMain("${msg}"),
              _grid1(2),
            ],
          ),
        ),
      ),
    );
  }
//-------------Row 2 ------------------------

//--------------Row 1-------------------------

   _row1(String title, String action) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: kTextTheme.displayMedium),
          Text(action, style: kTextTheme.bodyMedium),
        ],
      ),
    );
  }
//------------Grid -1--------------------------

 _rowMain(action) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: calpagelogin,
            child: Text('Add Product', style: kTextTheme.bodyMedium),
          ),
        ),
        Text(action, style: kTextTheme.bodyMedium),
      ],
    );
  }

 _grid1(int c) {
    return Expanded(
        child: GridView.count(
      crossAxisCount: c,
      padding: EdgeInsets.all(8.0),
      children: [
        for (final item in products) ...[
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                height: 700,
                decoration: BoxDecoration(gradient: kReverseGradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                          image: AssetImage('${item["Image"]}'),
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain),
                    ),
                    Text('${item["Title"]}', style: kTextTheme.bodyLarge),
                    Text('Rs. ${item["Price"]}', style: kTextTheme.bodyLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => EditProductPage(
                                        title: item["ProductID"])));
                          },
                          child:
                              Text('Edit', style: kTextTheme.bodyMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              pid = item["ProductID"];
                            });
                            showConDialog(context);;
                          },
                          child:
                              Text('Delete', style: kTextTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                
              },
            ),
          ),
        ],
      ],
    ));
  }
}
