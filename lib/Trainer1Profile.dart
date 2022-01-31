import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'home.dart';

import 'Services/trainer_info.dart';
import 'Entity/Trainer.dart';

class Trainer1Profile extends StatelessWidget {
  var name;
  var email;
  var age;
  var speciality;
  var about;
  Trainer1Profile(
      {Key? key,
      required this.name,
      required this.email,
      required this.age,
      required this.speciality,
      required this.about})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(
              this.name, this.email, this.age, this.speciality, this.about),
        ],
      ),
    );
  }
}

Widget buildContent(name, email, age, speciality, about) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
        Text(
          'Name : $name',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Email : $email',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Age : $age',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Speciality : $speciality',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'ABOUT ',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        Text('$about')
      ],
    );

Widget buildTop() {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      buildCoverImage(),
      Positioned(
        top: 200,
        child: buildProfileImage(),
      ),
    ],
  );
}

Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network(
          'https://img.mensxp.com/media/content/2017/Jun/brutally-hardcore-gyms-you-need-to-train-at-before-you-die-652x400-6-1496399902.jpg?w=652&h=400'),
      width: 500,
      height: 260,
    );

Widget buildProfileImage() => CircleAvatar(
      radius: 134 / 2,
      backgroundImage: AssetImage(
        'lib/images/Trainer1.jpg',
      ),
    );
