import 'package:flutter/material.dart';
import 'package:metrorun/screens/booking/stations/green_from.dart';
import 'package:metrorun/screens/booking/stations/green_to.dart';
import 'package:metrorun/screens/booking/stations/purple_from.dart';
import 'package:metrorun/screens/booking/stations/purple_to.dart';
import 'package:metrorun/screens/booking/ticket/payment.dart';
import 'package:metrorun/screens/home/home.dart';

// ignore: must_be_immutable
class Booking extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String from_station, to_station;
  // ignore: non_constant_identifier_names
  int from_index, to_index;

  // ignore: non_constant_identifier_names
  Booking({this.from_station, this.to_station, this.from_index, this.to_index});

  _BookingState createState() => _BookingState(
      from_station: from_station,
      to_station: to_station,
      from_index: from_index,
      to_index: to_index);
}

class _BookingState extends State<Booking> {
  // ignore: non_constant_identifier_names
  String from_station, to_station;
  // ignore: non_constant_identifier_names
  int from_index, to_index;
  double amount;

  _BookingState(
      // ignore: non_constant_identifier_names
      {this.from_station,
      // ignore: non_constant_identifier_names
      this.to_station,
      // ignore: non_constant_identifier_names
      this.from_index,
      // ignore: non_constant_identifier_names
      this.to_index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'Select Route',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.blue[900],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 80.0),
            Row(
              children: <Widget>[
                Text(
                  'From',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: RaisedButton(
                      color: Colors.green[600],
                      child: Text('Green Line',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GreenFrom()));
                        setState(() {
                          from_station = from_station;
                          from_index = from_index;
                        });
                      }),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: RaisedButton(
                      color: Colors.purple[400],
                      child: Text(
                        'Purple Line',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurpleFrom()));
                        setState(() {
                          from_station = from_station;
                          from_index = from_index;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(from_station ?? 'Select station',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 100.0),
            Row(
              children: <Widget>[
                Text(
                  'To',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(width: 50.0),
                Expanded(
                  child: RaisedButton(
                      color: Colors.green[600],
                      child: Text('Green Line',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GreenTo(from: from_station, frm: from_index)),
                        );
                        setState(() {
                          to_station = to_station;
                          to_index = to_index;
                        });
                      }),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: RaisedButton(
                      color: Colors.purple[400],
                      child: Text(
                        'Purple Line',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurpleTo(
                                    from: from_station, frm: from_index)));
                        setState(() {
                          to_station = to_station;
                          to_index = to_index;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(to_station ?? 'Select station',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 150.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    color: Colors.orange,
                    splashColor: Colors.yellowAccent,
                    child: Text('Proceed',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[900],
                        )),
                    onPressed: () {
                      if (from_station == 'Select Station' ||
                          to_station == 'Select Station' ||
                          to_station == null ||
                          from_station == null) {
                        showAlertDialog(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Payment(
                                    from_station: from_station,
                                    to_station: to_station,
                                    from_index: from_index,
                                    to_index: to_index)));
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
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
      content: Text("Select route to proceed"),
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
