import 'package:flutter/material.dart';
import 'package:metrorun/screens/booking/booking.dart';
import 'package:metrorun/screens/home/add_cash.dart';

class Front extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Container(
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.0),
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
                  child: Text(
                    'Buy Token',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Booking(
                                from_station: 'Select Station',
                                to_station: 'Select Station')));
                  },
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.0),
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cash()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget getImageAsset() {
  AssetImage assetImage = AssetImage('assets/MetroRun.png');
  Image image = Image(
    image: assetImage,
    //width: 500.0,
    //height: 500.0,
  );

  return Container(
    child: image,
    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
  );
}
