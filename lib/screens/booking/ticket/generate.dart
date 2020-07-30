import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';

import 'package:metrorun/screens/home/home.dart';

class QRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Generate(),
    );
  }
}

//to generate  qr code
const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
// ignore: non_constant_identifier_names
String RandomString(int strlen) {
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  //the qr generated everytime is unique
  String result = "";
  for (var i = 0; i < strlen; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

class Generate extends StatefulWidget {
  @override
  GenerateState createState() => GenerateState();
}

class GenerateState extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'QR code',   
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue[900],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 50.0),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Image.network(
                  'https://api.qrserver.com/v1/create-qr-code/?size=360x360&data=$RandomString(10)'),
              width: 400.0,
              height: 400.0,
            ),
            SizedBox(height: 80.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.0),
              child: ButtonTheme(
                minWidth: 150.0,
                height: 60.0,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  elevation: 5.0,
                  splashColor: Colors.yellowAccent,
                  color: Colors.orange,
                  textColor: Colors.blue[900],
                  child: Text(
                    'EXIT',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home())); //redirect to home screen after clicking on EXIT.
                  },
                ),
              ),
            ),
          ],
        ),
      ),
//          ),
//        )
    );
  }
}
