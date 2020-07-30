

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrorun/screens/authenticate/sign_in.dart';
// import 'package:metrorun/screens/home/add_cash.dart';
import 'package:metrorun/screens/home/front.dart';
import 'package:metrorun/screens/services/auth.dart';
// import 'package:photo_view/photo_view.dart';

import '../wrapper.dart';
import 'map.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();


    @override
    Widget build(BuildContext context) {
        return  Scaffold(

          backgroundColor: Colors.cyan[100],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },

            ),

            title: Text('Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                )),
            backgroundColor: Colors.orange,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue[900],
                ),
                label: Text('Logout',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue[900],
                    )),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Wrapper()));
                },
              ),
            ],
          ),


          body: Container(
            child: Front(),
          ),
          floatingActionButton: Container(
              padding: EdgeInsets.only(bottom: 15.0),
              height: 80.0,
              width: 80.0,
              child: FittedBox(
                child: FloatingActionButton(
                    child: Icon(Icons.map),
                    backgroundColor: Colors.orange,
                    splashColor: Colors.yellowAccent,
                    foregroundColor: Colors.blue[900],
                    tooltip: 'View Metro Map',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapDisplay()));
                    }),
              ))

//    ),
        );



  }




  //-------------------------Test Variable




//    Future<bool> _onBackPressed(context) {
//
//    bool exit = true;
//
//    if(exit) {
//      return showDialog(
//        context: context,
//        builder: (context) => new AlertDialog(
//          title: new Text('Are you sure?'),
//          content: new Text('Do you want to exit an App'),
//          actions: <Widget>[
//
//            new GestureDetector(
//              child: Text("NO"),
//              onTap: () {
//                Navigator.of(context).pop(false);
//              },
//            ),
//            SizedBox(width: 20.0),
//
//            new GestureDetector(
//              child: Text("YES"),
//              onTap: () {
//                Navigator.of(context).pop(true);
//              },
//            ),
//          ],
//        ),
//      ) ?? false;
//    }
//  }
}
