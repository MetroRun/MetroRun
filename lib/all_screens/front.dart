import 'package:flutter/material.dart';

class Front extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
            'Welcome',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),

      body: Container(
        child: ListView(
          children: <Widget>[

            getImageAsset(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.0),
              child: RaisedButton(
                elevation: 5.0,
                splashColor: Colors.yellowAccent,
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                    'Go',
                    style: TextStyle(
                      fontSize: 30.0,
                    )
                ),
                onPressed: () {},
              ),
            ),


            SizedBox(height: 25.0),

            Center(
              child: Text(
                'Click on GO to get started',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
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
  Image image = Image(image: assetImage, width: 500.0, height: 500.0,);

  return Container(
      child: image,
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal:20.0),
  );
}