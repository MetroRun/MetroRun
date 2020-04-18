import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MetroRun',
        home: FirstPage(),

      )
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: Text(
            ''
        ),
      ),

      body: Center(
      child: Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
      children: <Widget>[

            getImageAsset(),

            SizedBox(height: 100.0),

            RaisedButton(
              splashColor: Colors.yellowAccent,
              color: Colors.indigo[900],
              elevation: 5.0,
              child: Text(
                'GO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {},
              ),
          ],
        ),
      ),
    )
    );
  }
}

Widget getImageAsset() {

  return Container(
      decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/MetroRun.png'),
              fit: BoxFit.cover,
            ),
          ),
	 
  );
}
