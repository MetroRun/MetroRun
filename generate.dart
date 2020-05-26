import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: generate() ,
    );
  }

}
//to generate  qr code
const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
String RandomString(int strlen) {
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < strlen; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}


class generate extends StatefulWidget{
  @override
  generateState createState() => generateState();
}

class generateState extends State<generate> {
  @override

  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('QR code'),),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    child: Image.network(
                        'https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=$RandomString(10)'),
                    width: 400.0,
                    height: 400.0,
                  ),
                  SizedBox(height: 40.0),

                  RaisedButton(
                    elevation: 5.0,
                    color: Colors.cyan,
                    textColor: Colors.white,
                    child: Text(
                        'Exit',
                        style: TextStyle(
                          fontSize: 50.0,
                        )
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        )

    );

  }
}