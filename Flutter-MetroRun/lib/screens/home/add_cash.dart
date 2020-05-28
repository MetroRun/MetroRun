import 'package:flutter/material.dart';
import 'home.dart';

//void main() {
//
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//    title: 'Add cash to your Metro wallet',
//    home: Cash(),
//  ));
//}

class Cash extends StatefulWidget {
  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }


  String _display() {
    String result =
        ' $_currentItemSelected added.';
    return result;
  }

  void _reset() {
    displayAmount = '';
    _currentItemSelected = _money[0];
  }

  var _money = ['Rs.50','Rs.100','Rs.200','Rs.300','Rs.400','Rs.500','Rs.1000'];
  final double _minimumPadding = 5.0;

  var _currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _money[0];
  }

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
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue[900],
          ),
        ),
      ),

      body : Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: <Widget>[

                SizedBox(height: 150.0),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child:DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[900],
                          width: 3.0,
                        ),
                      ),
                    ),
                    items: _money.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      );
                    }).toList(),
                    value: _currentItemSelected,
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from dropdown
                      _onDropDownItemSelected(newValueSelected);
                    },
                  ),
                ),


                SizedBox(height: 100.0),

                Padding(
                padding: EdgeInsets.symmetric(horizontal: 90.0),
                child: ButtonTheme(
                  minWidth: 150.0,
                  height: 65.0,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    elevation: 5.0,
                    splashColor: Colors.yellowAccent,
                    color: Colors.orange,
                    textColor: Colors.blue[900],
                            child: Text(
                                'Add Money',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            SizedBox(height: 50.0),
                            onPressed: () {
                              
                              display();

                            },
                          ),
                        ),
                      ),

                



              ],
            ),
        ),
      ),
    );
  }
}
