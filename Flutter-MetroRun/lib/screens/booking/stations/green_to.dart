import 'package:flutter/material.dart';
import 'package:metrorun/screens/booking/booking.dart';


class GreenTo extends StatefulWidget {

  String from;
  int frm;
  GreenTo({this.from, this.frm});
  _GreenToState createState() => _GreenToState(from: from, frm: frm);
}

class _GreenToState extends State<GreenTo> {

  String from;
  int frm;
  _GreenToState({this.from, this.frm});

  @override
  Widget build(BuildContext context) {
    final greenLine = [
      'Yelachenahalli',
      'Jayaprakash Nagar',
      'Banashankari',
      'Rashtriya Vidyalaya Road',
      'Jayanagar',
      'South End Circle',
      'Lalbagh',
      'National College',
      'K.R.Market',
      'Chickpete',
      'Nadaprabhu Kempegowda Station Majestic',
      'Mantri Square Sampige Road',
      'Srirampura',
      'Kuvempu Road',
      'Rajajinagar',
      'Mahalakshmi layout',
      'Sandal Soap Factory',
      'Yeshwantpur',
      'Gorguntepalya',
      'Peenya',
      'Peenya Industry',
      'Jalahalli',
      'Dasarahalli',
      'Nagasandra'
    ];

    return Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          leading : GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
              }
          ),
          backgroundColor: Colors.green,
          title: Text('Select station',
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.w500,
              )),
        ),
        body: ListView.separated(
            itemCount: greenLine.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(
                    greenLine[index],
                    style: TextStyle(
                      fontSize: 23.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Booking(from_station: from, to_station: greenLine[index], from_index: frm, to_index: index)));
                    print(greenLine[index]);
                    print(index);
                  });
            },
            separatorBuilder: (context, index) {
              return Divider();
            }));
  }

//  @override
//  void onBackPressed() {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) =>
//                Booking()
//        )
//    );
//  }

}