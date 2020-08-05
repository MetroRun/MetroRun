import 'package:flutter/material.dart';
import 'home.dart';

//Widget changes with the users' inputs
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


  final double _minimumPadding = 5.0;

  var _currentItemSelected; // to store the selected option out of the given list of options


//Key to keep track of items selected
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
              MaterialPageRoute(builder: (context) => Home()), //Go to the home screen by pressing the back arrow icon
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
                          'Select the amount',
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
                          _currentItemSelected == 'Select the amount')
                        showAlertDialog(context);
                      else {

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
