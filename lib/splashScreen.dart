import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:metrorun/screens/wrapper.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});

    return true;
  }



  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => Wrapper()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blue,
      body: Container(
      margin: const EdgeInsets.only(left: 100.0, top: 200.0,right: 100.0),
        child: Stack(
          alignment: Alignment.center,

          children: <Widget>[

            CircleAvatar(
                child: Image.asset('assets/splashScreen.png',
                 ),
                radius: 100,
                backgroundColor: Colors.cyan,
            ),

          ],
        ),
      ),
    );
  }


}
