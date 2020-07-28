import 'package:flutter/material.dart';
import 'home.dart';

class Cash extends StatefulWidget {
  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
  List<String> _money = [
    'Rs.50',
    'Rs.100',
    'Rs.200',
    'Rs.300',
    'Rs.400',
    'Rs.500',
    'Rs.1000'
  ];

  // List<double> _prices = [50, 100, 200, 300, 400, 500, 1000];
  // var price;

  final double _minimumPadding = 5.0;

  var _currentItemSelected;

  // DatabaseService data;
  // _CashState({this.data});
  // final db = Firestore.instance;

  var _formKey = GlobalKey<FormState>();
  var displayAmount = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        backgroundColor: Colors.orange,
        elevation: 5.0,
        title: Text(
          'Add money to your Metro Wallet',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue[900],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 200.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.0),
                child: DropdownButton(
                  hint: _currentItemSelected == null
                      ? Text(
                          'Select an option',
                          style: TextStyle(
                              color: Colors.blue[900], fontSize: 20.0),
                        )
                      : Text(
                          _currentItemSelected,
                          style: TextStyle(
                              color: Colors.blue[900], fontSize: 20.0),
                        ),
                  isExpanded: true,
                  iconSize: 40.0,
                  iconEnabledColor: Colors.blue[900],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  items: _money.map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(() {
                      _currentItemSelected = val;
                      // if (val == _money[0])
                      //   price = _prices[0];
                      // else if (val == _money[1])
                      //   price = _prices[1];
                      // else if (val == _money[2])
                      //   price = _prices[2];
                      // else if (val == _money[3])
                      //   price = _prices[3];
                      // else if (val == _money[4])
                      //   price = _prices[4];
                      // else if (val == _money[5])
                      //   price = _prices[5];
                      // else if (val == _money[6]) price = _prices[6];
                    });
                  },
                ),
              ),
              SizedBox(height: 200.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                child: ButtonTheme(
                  minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    elevation: 5.0,
                    splashColor: Colors.yellowAccent,
                    color: Colors.orange,
                    textColor: Colors.blue[900],
                    child: Text('Add Money',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        )),
                    onPressed: () async {
                      if (_currentItemSelected == null ||
                          _currentItemSelected == 'Select an option')
                        showAlertDialog(context);
                      else {
                        // var updatedamt = data.cash + price;
                        // print(price);
                        // print(data.cash);
                        // print(updatedamt);
                        // var firebaseUser =
                        //     await FirebaseAuth.instance.currentUser();
                        // db.collection("users").document(uid).setData({
                        //   'Cash': updatedamt,
                        // });
                        showConfirmDialog(context);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  showConfirmDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Updated !"),
      content: Text("$_currentItemSelected has been credited to your wallet"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text('Please select an amount that you wish to add !'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
