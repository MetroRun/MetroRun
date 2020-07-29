import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class MapDisplay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return Container(
         child: PhotoView(
           imageProvider: AssetImage("assets/MetroMap.jpg"),
         )
     );
  }
}