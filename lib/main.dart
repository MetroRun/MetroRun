import 'package:flutter/material.dart';
import 'package:metrorun/screens/models/user.dart';
import 'package:metrorun/screens/services/auth.dart';
import 'package:metrorun/splashScreen.dart';
import 'package:metrorun/screens/wrapper.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        )
    );
  }
}
//
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//
//
//
//void main() => runApp(MetroTicket());
//
//class Ticket extends StatelessWidget {
//  const Ticket({
//    Key key,
//    this.innerRadius = const BorderRadius.all(Radius.circular(0.0)),
//    this.outerRadius = const BorderRadius.all(Radius.circular(0.0)),
//    this.child,
//    this.boxShadow = const [],
//    this.dashedBottom = false
//  }) : super(key: key);
//
//  final BorderRadius innerRadius;
//
//  final BorderRadius outerRadius;
//
//  final List<BoxShadow> boxShadow;
//
//
//  final bool dashedBottom;
//
//  /// The [child] contained by the ticket widget.
//  final Widget child;
//
//  @override
//  Widget build(BuildContext context) {
//    return ClipShadow(
//      clipper: TicketClipper(innerRadius, outerRadius),
//      boxShadow: boxShadow,
//      child: child,
//    );
//  }
//}
//
//class TicketClipper extends CustomClipper<Path> {
//  TicketClipper(this.innerRadius, this.outerRadius);
//
//  final BorderRadius innerRadius;
//
//  final BorderRadius outerRadius;
//
//  @override
//  Path getClip(Size size) {
//    /// approximation to a circular arc
//    const C = 0.551915024494;
//    final path = Path();
//
//    var currentUseInner = false;
//    var currentRadius = Radius.circular(0.0);
//
//    currentUseInner = innerRadius.topLeft != Radius.circular(0.0);
//    currentRadius = currentUseInner ? innerRadius.topLeft : outerRadius.topLeft;
//    path.moveTo(0.0, currentRadius.y);
//    path.cubicTo(
//        currentUseInner ? currentRadius.x * C : 0.0,
//        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
//        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
//        currentUseInner ? currentRadius.y * C : 0.0,
//        currentRadius.x, 0.0);
//
//    currentUseInner = innerRadius.topRight != Radius.circular(0.0);
//    currentRadius = currentUseInner ? innerRadius.topRight : outerRadius.topRight;
//    path.lineTo(size.width - currentRadius.x, 0.0);
//    path.cubicTo(
//        currentUseInner ? size.width - currentRadius.x : size.width - currentRadius.x * (1 - C),
//        currentUseInner ? currentRadius.y * C : 0.0,
//        currentUseInner ? size.width - currentRadius.x * C : size.width,
//        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
//        size.width, currentRadius.y);
//
//    currentUseInner = innerRadius.bottomRight != Radius.circular(0.0);
//    currentRadius = currentUseInner ? innerRadius.bottomRight : outerRadius.bottomRight;
//    path.lineTo(size.width, size.height - currentRadius.y);
//    path.cubicTo(
//        currentUseInner ? size.width - currentRadius.x * C : size.width,
//        currentUseInner ? size.height - currentRadius.y : size.height - currentRadius.y * (1 - C),
//        currentUseInner ? size.width - currentRadius.x : size.width - currentRadius.x * (1 - C),
//        currentUseInner ? size.height - currentRadius.y * C : size.height,
//        size.width - currentRadius.x, size.height);
//
//    currentUseInner = innerRadius.bottomLeft != Radius.circular(0.0);
//    currentRadius = currentUseInner ? innerRadius.bottomLeft : outerRadius.bottomLeft;
//    path.lineTo(currentRadius.x, size.height);
//    path.cubicTo(
//        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
//        currentUseInner ? size.height - currentRadius.y * C : size.height,
//        currentUseInner ? currentRadius.x * C : 0.0,
//        currentUseInner ? size.height - currentRadius.y : size.height - currentRadius.y * (1 - C),
//        0.0, size.height - currentRadius.y);
//
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) {
//    return true;
//  }
//}
//class MetroTicket extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    var ticket = Ticket(
//      innerRadius: BorderRadius.only(
//          bottomLeft: Radius.circular(10.0),
//          bottomRight: Radius.circular(10.0)
//      ),
//      outerRadius: BorderRadius.all(Radius.circular(10.0)),
//      boxShadow: [
//        BoxShadow(
//          offset: Offset(0, 4.0),
//          blurRadius: 2.0,
//          spreadRadius: 2.0,
//          color: Color.fromRGBO(196, 196, 196, .76),
//        )
//      ],
//      child: Image.asset(
//
//        'assets/nammaMetro.png',
//
//      ),
//    );
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Here\'s your ticket'),
//        ),
//        body: Container(
//          width: 375,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              SizedBox(height: 30.0,),
//              ticket,
//              Ticket(
//                innerRadius: BorderRadius.only(
//                    topLeft: Radius.circular(10.0),
//                    topRight: Radius.circular(10.0)
//                ),
//                outerRadius: BorderRadius.all(Radius.circular(10.0)),
//                boxShadow: [
//                  BoxShadow(
//                    offset: Offset(0, 4),
//                    blurRadius: 2.0,
//                    spreadRadius: 2.0,
//                    color: Color.fromRGBO(196, 196, 196, .76),
//                  )
//                ],
//                child: Container(
//                  color: Colors.white,
//                  width: 300,
//                  child: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Icon(
//                              Icons.remove,
//                              color: Colors.lightBlue,
//                            ),
//                            Text(
//                              'Cost : ',
//                              style: TextStyle(fontSize: 18.0),
//                            ),
//                            Icon(
//                              Icons.add,
//                              color: Colors.lightBlue,
//                            ),
//                          ],
//                        ),
//                      ),
//                      Divider(height: 0.0),
//                      Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text('Date'),
//                                  FittedBox(
//                                    child: Text(
//                                      '22/05/20   ',
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.w600,
//                                          fontSize: 18.0),
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text('From'),
//                                    FittedBox(
//                                      child: Text(
//                                        'Baiyappanahalli',
//                                        style: TextStyle(
//                                            fontWeight: FontWeight.w600,
//                                            fontSize: 18.0),
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              )),
//                          Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text('To'),
//                                    FittedBox(
//                                      child: Text(
//                                        'MG Road  ',
//                                        style: TextStyle(
//                                            fontWeight: FontWeight.w600,
//                                            fontSize: 18.0),
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              )),
//                        ],
//                      ),
//                      Container(
//                        width: double.infinity,
//                        color: Colors.lightBlue,
//                        padding: EdgeInsets.symmetric(vertical: 8.0),
//                        child: Center(
//                          child: Text(
//                            'Proceed',
//                            style:
//                            TextStyle(color: Colors.white, fontSize: 16.0),
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//
//
//class _ClipShadowPainter extends CustomPainter {
//  /// If non-null, determines which clip to use.
//  final CustomClipper<Path> clipper;
//
//  /// A list of shadows cast by this box behind the box.
//  final List<BoxShadow> clipShadow;
//
//  _ClipShadowPainter({
//    @required this.clipper,
//    @required this.clipShadow
//  });
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    clipShadow.forEach((BoxShadow shadow) {
//      var paint = shadow.toPaint();
//      var spreadSize = Size(size.width + shadow.spreadRadius * 2, size.height + shadow.spreadRadius * 2);
//      var clipPath = clipper.getClip(spreadSize).shift(Offset(
//          shadow.offset.dx - shadow.spreadRadius,
//          shadow.offset.dy - shadow.spreadRadius
//      ));
//      canvas.drawPath(clipPath, paint);
////      canvas.drawShadow(clipper.getClip(size), shadow.color, shadow.spreadRadius, true);
//    });
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}
//
//class ClipShadow extends StatelessWidget {
//  /// A list of shadows cast by this box behind the box.
//  final List<BoxShadow> boxShadow;
//
//  /// If non-null, determines which clip to use.
//  final CustomClipper<Path> clipper;
//
//  /// The [Widget] below this widget in the tree.
//  final Widget child;
//
//  ClipShadow({
//    @required this.boxShadow,
//    @required this.clipper,
//    @required this.child
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return CustomPaint(
//      painter: _ClipShadowPainter(
//          clipShadow: boxShadow,
//          clipper: clipper
//      ),
//      child: ClipPath(
//        clipper: clipper,
//        child: child,
//      ),
//    );
//  }
//}