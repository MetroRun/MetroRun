import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrorun/screens/booking/ticket/generate.dart';

//void main() => runApp(MyApp());
//
class QRGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Payment",
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new QRCode(),
    );
  }
}

class QRCode extends StatefulWidget {
  _QRCodeState createState() => new _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    enableButton() {
      setState(() {
        _enabled = true;
      });
    }

    if (_enabled) {
      _onPressed = () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Generate())
        // );
      };
    }
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Payment successfull"),
            SizedBox(height: 2.5),
            new Text("Click on Done to proceed further"),
            SizedBox(height: 2.5),
            RaisedButton(
              child: new Text("DONE"),
              onPressed: enableButton,
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            new ListTile(
              title: new RaisedButton(
                child: new Text("Get QR code"),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                onPressed: _onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
