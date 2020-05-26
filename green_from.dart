import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro/booking/booking.dart';
import 'package:metro/booking/payment.dart';

class GreenFrom extends StatefulWidget {

  int from_index;
  GreenFrom({this.from_index});

  _GreenFromState createState() => _GreenFromState(from_index: from_index);
}

class _GreenFromState extends State<GreenFrom> {

  int from_index;
  _GreenFromState({this.from_index});

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
                                Booking(from_station: greenLine[index], from_index: index)));
                    print(greenLine[index]);
                    print(index);
                  }
              );

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