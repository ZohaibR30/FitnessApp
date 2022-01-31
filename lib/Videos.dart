import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'home.dart';


class Videos extends StatelessWidget{
  var Link;
  Videos({Key? key, required this.Link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildContent(this.Link),
        ],
      ),
    );
  }

  Widget buildContent(link) => Container(
    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const SizedBox(height: 80),
        Text(
          "Link:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          Link,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
        )

      ],
    ),
  );

}