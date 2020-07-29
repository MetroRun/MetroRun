import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metrorun/screens/booking/ticket/generate.dart';

// ignore: must_be_immutable
class Payment extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String from_station, to_station;
  // ignore: non_constant_identifier_names
  int from_index, to_index;
  // ignore: non_constant_identifier_names
  Payment({this.from_station, this.to_station, this.from_index, this.to_index});
  PaymentState createState() => PaymentState(
      from_station: from_station,
      to_station: to_station,
      from_index: from_index,
      to_index: to_index);
}

class PaymentState extends State<Payment> {
  static DateTime date = DateTime.now();
  static TimeOfDay time = TimeOfDay.now();
  final String currenttime = '${time.hour}:${time.minute}';
  final String currentdate = '${date.day}/${date.month}/${date.year}';

  // ignore: non_constant_identifier_names
  String from_station, to_station;
  // ignore: non_constant_identifier_names
  var from_index, to_index, numStops;
  double amount;

  PaymentState(
      // ignore: non_constant_identifier_names
      {this.from_station,
      // ignore: non_constant_identifier_names
      this.to_station,
      // ignore: non_constant_identifier_names
      this.from_index,
      // ignore: non_constant_identifier_names
      this.to_index});

  // ignore: must_call_super
  void initState() {
    amount = Calculate();
  }

  var purpleLine = [
    'Baiyyappanahalli',
    'Swami Vivekananda Road',
    'Indiranagar',
    'Halasuru',
    'Trinity',
    'Mahatma Gandhi Road',
    'Cubbon Park',
    'Vidhana Soudha',
    'Sir M Vishweshwarayya Central College',
    'Nadaprabhu Kempegowda Majestic',
    'KSR City Railway Station',
    'Magadi Road',
    'Hosahalli',
    'Vijayanagar',
    'Attiguppe',
    'Deepanjali Nagar',
    'Mysuru Road'
  ];

  var greenLine = [
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

  @override
  Widget build(BuildContext context) {
    var ticket = Ticket(
      innerRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
      outerRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.0),
          blurRadius: 2.0,
          spreadRadius: 2.0,
          color: Color.fromRGBO(196, 196, 196, .76),
        )
      ],
      child: Image.asset(
        'assets/nammaMetro.png',
      ),
    );

    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Here\'s your ticket',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue[900],
          ),
        ),

//        actions: <Widget>[
//
//          FlatButton.icon(
//            icon: Icon(
//              Icons.bookmark_border,
//              color: Colors.blue[900],
//            ),
//            label: Text(
//              'Save Route',
//              style: TextStyle(
//                fontSize: 20.0,
//                color: Colors.blue[900],
//              ),
//            ),
//            onPressed: () {
//              Saved(from_station: from_station, to_station: to_station),
//            },
//    ),
//
//    ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        child: Container(
          width: 375,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30.0),
              ticket,
              Ticket(
                innerRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                outerRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    color: Color.fromRGBO(196, 196, 196, .76),
                  )
                ],
                child: Container(
                  color: Colors.white,
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                          Icon(
//                            Icons.remove,
//                            color: Colors.lightBlue,
//                          ),
//                            Center(
//                        child: Text(
//                              'Cost : Rs. ${calculate()}',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                fontSize: 25.0,
//                                fontWeight: FontWeight.w500,
//                              ),
//                            ),
//                            ),
//                          Icon(
//                            Icons.add,
//                            color: Colors.lightBlue,
//                          ),
//                          ],
//                        ),
//                      ),

                      Divider(height: 0.0),

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Date'),
                                  FittedBox(
                                    child: Text(
                                      currentdate,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Time'),
                                  FittedBox(
                                    child: Text(
                                      currenttime,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('From'),
                                FittedBox(
                                  child: Display(from_station),
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('To'),
                                FittedBox(
                                  child: Display(to_station),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(height: 50.0),

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: switchtext(),
                          ),
                        ],
                      ),

                      SizedBox(height: 50.0),

//                      Container(
//                        width: double.infinity,
//                        height: 80.0,
//                        color: Colors.lightBlue,
//                        padding: EdgeInsets.symmetric(vertical: 8.0),
//                        child: Center(
//                          child: Text(
//                            'Pay',
//                            style:
//                            TextStyle(color: Colors.white, fontSize: 20.0),
//                          ),
//                        ),
//                      ),

                      Center(
                        child: Text(
                          'Cost : Rs. $amount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),

                      ButtonTheme(
                        minWidth: 500.0,
                        height: 60.0,
                        child: RaisedButton(
                            color: Colors.orange,
                            splashColor: Colors.yellowAccent,
                            child: Text('PAY',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w500,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRCode()));
                            }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  double Calculate() {
    var greenDown = [
      'Nadaprabhu Kempegowda Station Majestic',
      'Chickpete',
      'K.R.Market',
      'National College',
      'Lalbagh',
      'South End Circle',
      'Jayanagar',
      'Rashtriya Vidyalaya Road',
      'Banashankari',
      'Jayaprakash Nagar',
      'Yelachenahalli'
    ];

    var greenTop = [
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

    var purpleRight = [
      'Nadaprabhu Kempegowda Majestic',
      'Sir M Vishweshwarayya Central College',
      'Vidhana Soudha',
      'Cubbon Park',
      'Mahatma Gandhi Road',
      'Trinity',
      'Halasuru',
      'Indiranagar',
      'Swami Vivekananda Road',
      'Baiyyappanahalli'
    ];

    var purpleLeft = [
      'Nadaprabhu Kempegowda Majestic',
      'KSR City Railway Station',
      'Magadi Road',
      'Hosahalli',
      'Vijayanagar',
      'Attiguppe',
      'Deepanjali Nagar',
      'Mysuru Road'
    ];

    int counter = 0, i = 0, from = 0, to = 0;

    if (greenLine.contains(from_station) && purpleLine.contains(to_station)) {
      if (greenTop.contains(from_station)) {
        for (i = 0; i < greenTop.length; i++) {
          if (greenTop[i] == from_station) {
            from = i;
            numStops = from;

            if (purpleRight.contains(to_station)) {
              for (i = 0; i < purpleRight.length; i++) {
                if (purpleRight[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }

            if (purpleLeft.contains(to_station)) {
              for (i = 0; i < purpleLeft.length; i++) {
                if (purpleLeft[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }
          }
        }
      }

      if (greenDown.contains(from_station)) {
        for (i = 0; i < greenDown.length; i++) {
          if (greenDown[i] == from_station) {
            from = i;
            numStops = from;

            if (purpleRight.contains(to_station)) {
              for (i = 0; i < purpleRight.length; i++) {
                if (purpleRight[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }

            if (purpleLeft.contains(to_station)) {
              for (i = 0; i < purpleLeft.length; i++) {
                if (purpleLeft[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }
          }
        }
      }
    } // green from, purple to

    if (purpleLine.contains(from_station) && greenLine.contains(to_station)) {
      if (purpleRight.contains(from_station)) {
        for (i = 0; i < purpleRight.length; i++) {
          if (purpleRight[i] == from_station) {
            from = i;
            numStops = from;
            print(numStops);

            if (greenTop.contains(to_station)) {
              for (i = 0; i < greenTop.length; i++) {
                if (greenTop[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }
            if (greenDown.contains(to_station)) {
              for (i = 0; i < greenDown.length; i++) {
                if (greenDown[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }
          }
        }
      }

      if (purpleLeft.contains(from_station)) {
        for (i = 0; i < purpleLeft.length; i++) {
          if (purpleLeft[i] == from_station) {
            from = i;
            numStops = from;

            if (greenTop.contains(to_station)) {
              for (i = 0; i < greenTop.length; i++) {
                if (greenTop[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }
            if (greenDown.contains(to_station)) {
              for (i = 0; i < greenDown.length; i++) {
                if (greenDown[i] == to_station) {
                  to = i;
                  counter = from + to;
                  if (counter == 1) {
                    return (10.00);
                  } else
                    return (1 + (counter / 2) * 5.00);
                }
              }
            }
          }
        }
      }
    } // purple from, green to
    else {
      if (((to_index - from_index).abs()) == 1) {
        return (10.00);
      } else
        return ((1 + (((to_index - from_index).abs()) / 2)) * 5.00);
    }
//        return ((1+((to_index - from_index).abs())) * 5.0);
  }

  // ignore: non_constant_identifier_names
  Widget Display(String station) {
    if (greenLine.contains(station)) {
      return Text(
        station,
        style: TextStyle(
          color: Colors.green[600],
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (purpleLine.contains(station)) {
      return Text(
        station,
        style: TextStyle(
          color: Colors.purple,
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  Widget switchtext() {
    if (greenLine.contains(from_station) && purpleLine.contains(to_station)) {
      return Text(
        'Switch lines after $numStops stops at Kempegowda Majestic',
        style: TextStyle(
          color: Colors.green[600],
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      );
    } else if (purpleLine.contains(from_station) &&
        greenLine.contains(to_station)) {
      return Text(
        'Switch lines after $numStops stops at Kempegowda Majestic',
        style: TextStyle(
          color: Colors.purple,
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      );
    } else {
      return Container(
        child: SizedBox(height: 0.0),
      );
    }
  }
}

class Ticket extends StatelessWidget {
  const Ticket(
      {Key key,
      this.innerRadius = const BorderRadius.all(Radius.circular(0.0)),
      this.outerRadius = const BorderRadius.all(Radius.circular(0.0)),
      this.child,
      this.boxShadow = const [],
      this.dashedBottom = false})
      : super(key: key);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  final List<BoxShadow> boxShadow;

  final bool dashedBottom;

  /// The [child] contained by the ticket widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: TicketClipper(innerRadius, outerRadius),
      boxShadow: boxShadow,
      child: child,
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  TicketClipper(this.innerRadius, this.outerRadius);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  @override
  Path getClip(Size size) {
    /// approximation to a circular arc
    const C = 0.551915024494;
    final path = Path();

    var currentUseInner = false;
    var currentRadius = Radius.circular(0.0);

    currentUseInner = innerRadius.topLeft != Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topLeft : outerRadius.topLeft;
    path.moveTo(0.0, currentRadius.y);
    path.cubicTo(
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentRadius.x,
        0.0);

    currentUseInner = innerRadius.topRight != Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.topRight : outerRadius.topRight;
    path.lineTo(size.width - currentRadius.x, 0.0);
    path.cubicTo(
        currentUseInner
            ? size.width - currentRadius.x
            : size.width - currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        size.width,
        currentRadius.y);

    currentUseInner = innerRadius.bottomRight != Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.bottomRight : outerRadius.bottomRight;
    path.lineTo(size.width, size.height - currentRadius.y);
    path.cubicTo(
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner
            ? size.height - currentRadius.y
            : size.height - currentRadius.y * (1 - C),
        currentUseInner
            ? size.width - currentRadius.x
            : size.width - currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        size.width - currentRadius.x,
        size.height);

    currentUseInner = innerRadius.bottomLeft != Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.bottomLeft : outerRadius.bottomLeft;
    path.lineTo(currentRadius.x, size.height);
    path.cubicTo(
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner
            ? size.height - currentRadius.y
            : size.height - currentRadius.y * (1 - C),
        0.0,
        size.height - currentRadius.y);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _ClipShadowPainter extends CustomPainter {
  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> clipShadow;

  _ClipShadowPainter({@required this.clipper, @required this.clipShadow});

  @override
  void paint(Canvas canvas, Size size) {
    clipShadow.forEach((BoxShadow shadow) {
      var paint = shadow.toPaint();
      var spreadSize = Size(size.width + shadow.spreadRadius * 2,
          size.height + shadow.spreadRadius * 2);
      var clipPath = clipper.getClip(spreadSize).shift(Offset(
          shadow.offset.dx - shadow.spreadRadius,
          shadow.offset.dy - shadow.spreadRadius));
      canvas.drawPath(clipPath, paint);
//      canvas.drawShadow(clipper.getClip(size), shadow.color, shadow.spreadRadius, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow extends StatelessWidget {
  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// The [Widget] below this widget in the tree.
  final Widget child;

  ClipShadow(
      {@required this.boxShadow, @required this.clipper, @required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(clipShadow: boxShadow, clipper: clipper),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
