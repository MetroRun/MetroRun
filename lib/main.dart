import 'package:flutter/material.dart';
import 'package:metrorun/screens/models/user.dart';
import 'package:metrorun/screens/services/auth.dart';
import 'package:metrorun/splashScreen.dart';
import 'package:metrorun/screens/wrapper.dart';
import 'package:provider/provider.dart';

//Root widget
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(), //The very first screen
        )
    );
  }
}
