import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'getstarted.dart';
import 'Entity/user_signup.dart';
import 'Trainer1Profile.dart';
import 'Services/trainer_info.dart';
import 'Services/services_user_signup.dart';
import 'Entity/Trainer.dart';
import 'globals.dart';
import 'package:signupp/Videos.dart';
import 'ForPass.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyTapBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: const Color(0xFF001D4B),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      //labelPadding: const EdgeInsets.only(left:0, right:0),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Arms & Shoulder"),
                        Tab(text: "Abs & Core"),
                        Tab(text: "Legs & Glutes"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.maxFinite,
                  height: 410,
                  child: TabBarView(
                    children: [
                      ListView(
                        padding: const EdgeInsets.all(8),
                        children: [
                          buildBackgroundCard1(context),
                          SizedBox(height: 30),
                          buildBackgroundCard2(context),
                          SizedBox(height: 30),
                          buildBackgroundCard3(context)
                        ],
                      ),
                      ListView(
                        padding: const EdgeInsets.all(8),
                        children: [
                          buildBackgroundCard4(context),
                          SizedBox(height: 30),
                          buildBackgroundCard5(context),
                          SizedBox(height: 30),
                          buildBackgroundCard6(context)
                        ],
                      ),
                      ListView(
                        padding: const EdgeInsets.all(8),
                        children: [
                          buildBackgroundCard7(context),
                          SizedBox(height: 30),
                          buildBackgroundCard8(context),
                          SizedBox(height: 30),
                          buildBackgroundCard9(context)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp>
    with AutomaticKeepAliveClientMixin<MyApp> {
  int _currentIndex = 0;

  bool get wantKeepAlive => true;
  final screens = [
    _Discovery(),
    _MyTapBar(),
    _Trainer(),
    _Dietplan(),
    _Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(toolbarHeight: 0, backgroundColor: const Color(0xFF001D4B)),
        backgroundColor: Colors.white,
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: const Color(0xFF001D4B)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_sharp),
                  label: 'Exercises',
                  backgroundColor: const Color(0xFF001D4B)),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.armFlex),
                  label: 'Trainer',
                  backgroundColor: const Color(0xFF001D4B)),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.foodApple),
                  label: 'Diet',
                  backgroundColor: const Color(0xFF001D4B)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: const Color(0xFF001D4B))
            ],
            onTap: (index) async {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            }),
      ),
    );
  }
}

class _Discovery extends StatelessWidget {
  _Discovery();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Litt Up',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  var _name = Global.username;
  var _calorie = Global.User_Calorie;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("lib/images/undraw_pilates_gpdb.png"),
                )),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    "Good Morning $_name",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 40,
                      children: [
                        BuildGridCard(),
                        Row(
                          children: [
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children: [
                                  BuildGridCard2(),
                                  BuildGridCard3(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BuildGridCard4(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildGridCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  "Initial Calories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF660707),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "$_calorie",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                    Text(
                      " KCAL",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "                 2000-2500",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Healthy Diet Calories",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildGridCard2() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Calories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF660707),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "2200",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                    Text(
                      " KCAL",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Swipe Up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "to see your set Goal",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildGridCard3() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Goal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF660707),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "2000",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                    Text(
                      " KCAL",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Swipe Down",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "to See Current Calories",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF660707),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildGridCard4() {
    var _workout_time = Global.workout_time;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Workout time",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF06066F),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "$_workout_time",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF06066F),
                      ),
                    ),
                    Text(
                      " Mins",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF06066F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Keep it Up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF06066F),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Work hard to reach your Goal",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF06066F),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

Widget buildBackgroundCard1(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 14).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1JDSgKlp2elf2zRNpP1XWSvmv_HWbxhig/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage(
                'lib/images/Bis_and_Tris.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Bis and Tris',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Beginners',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 14 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard2(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 20).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1gmoOJcmizxJ1kHGzupx2y4Ke6kXdlWaP/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/UpperBody.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Tank Top Arms',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Intermediate',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 20 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard3(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 24).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/19SbWjGADFYGOJjpIsATuO1JNds-WzldC/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/UpperBody2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Upper Body Sculpt',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Hardcore',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 24 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard4(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 10).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1aaDyLMa3VxVVa_n8qUIC6HktHxylAtTe/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/QuickCoreCrush.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Quick Core Crush',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Beginner',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 10 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard5(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 15).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1C-_bt6c5uMyz1EHkF_5PdpTxAAV-kVc0/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/AbBurner.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Ab Burner 2.0',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Intermediate',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 15 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard6(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 26).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1JDSgKlp2elf2zRNpP1XWSvmv_HWbxhig/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/UpperbodyCore.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Upper Body Core Blend',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Hardcore',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 26 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard7(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 15).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1JDSgKlp2elf2zRNpP1XWSvmv_HWbxhig/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/GlutesAndGlory.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Glutes and Glory',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Beginner',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 15 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard8(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 15).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1JDSgKlp2elf2zRNpP1XWSvmv_HWbxhig/view?usp=sharing')));
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/LeanerLegs.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Leaner Legs 2.0',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Intermediate',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 15 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

Widget buildBackgroundCard9(context) {
  return InkWell(
    onTap: () {
      Global.workout_time = (int.parse(Global.workout_time) + 30).toString();
      Services_user_signup.updateWorkoutTime(Global.username, Global.workout_time)
          .then((result) {
        if (result == 'success') {
          print("Workout Time Updated Successfully");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Videos(
                      Link:
                      'https://drive.google.com/file/d/1JDSgKlp2elf2zRNpP1XWSvmv_HWbxhig/view?usp=sharing')));;
        }
        if (result == 'error') {
          print("Cannot Be Changed");
        }
      });
    },
    child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: new DecorationImage(
              image: ExactAssetImage('lib/images/Legpocalypse.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              )),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Leg-pocalypse Now',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Hardcore',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Time Duration: 30 mins',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
        ])),
  );
}

class _Settings extends StatelessWidget {
  var _name = Global.username;
  void deleteUser(context) {
    Services_user_signup.deleteUser(_name).then((result) {
      if (result == 'success') {
        print("User Deleted");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Start()),
        );
      }
      if (result == 'error') {
        print("User Cannot Be Deletd");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  void username(BuildContext context) {
    var alertdialog = AlertDialog(
        title: Text("Below is your username"), content: Text("$_name"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }

  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Settings'),
          leading: const Icon(Icons.settings_applications),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Username'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            username(context);
          },
        ),
        ListTile(
          title: const Text('Change Password'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForPass()),
            );
          },
        ),
        ListTile(
          title: const Text('Privacy'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Sign Out'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Start()),
            );
          },
        ),
        ListTile(
          title: const Text('About'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Delete Account'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            deleteUser(context);
          },
        ),
      ],
    );
  }
}

class _Trainer extends StatelessWidget {
  List<Trainer> trainers = [];
  late Trainer train;

  void showinfo(context, int id) {
    trainer_info.getTrainer(id).then(
      (trainer) {
        trainers = trainer;

        String name = (trainers.map((e) => e.name)).toString();
        String email = (trainers.map((e) => e.email)).toString();
        String age = (trainers.map((e) => e.age)).toString();
        String speciality = (trainers.map((e) => e.speciality)).toString();
        String about = (trainers.map((e) => e.about)).toString();

        name = name.replaceAll(RegExp(r'[(,)]'), '');
        email = email.replaceAll(RegExp(r'[(,)]'), '');
        age = age.replaceAll(RegExp(r'[(,)]'), '');
        speciality = speciality.replaceAll(RegExp(r'[(,)]'), '');
        about = about.replaceAll(RegExp(r'[(,)]'), '');

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Trainer1Profile(
                  name: name,
                  email: email,
                  age: age,
                  speciality: speciality,
                  about: about)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Trainers"),
          backgroundColor: const Color(0xFF001D4B)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: [
                  _Trainer1(context),
                  _Trainer2(context),
                  _Trainer3(context),
                  _Trainer4(context),
                  _Trainer5(context),
                  _Trainer6(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Trainer1(context) {
    return InkWell(
      onTap: () {
        showinfo(context, 1);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  Trainer1Profile(id: 1)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF660707),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                      image: ExactAssetImage
                        (
                        'lib/images/Trainer1.jpg',
                      ),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rating: 5 Star",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Full Body",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Trainer2(context) {
    return InkWell(
      onTap: () {
        showinfo(context, 2);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  Trainer1Profile(id: 2)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF660707),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                      image: ExactAssetImage
                        (
                        'lib/images/Trainer2.jpg',
                      ),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rating: 5 Star",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Upper Body",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Trainer3(context) {
    return InkWell(
      onTap: () {
        showinfo(context, 3);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  Trainer1Profile(id: 3)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF660707),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                      image: ExactAssetImage
                        (
                        'lib/images/Trainer3.jpg',
                      ),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rating: 4 Star",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Upper Body and Core",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Trainer4(context) {
    return InkWell(
      onTap: () {
        showinfo(context, 4);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  Trainer1Profile(id: 4)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF660707),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                      image: ExactAssetImage
                        (
                        'lib/images/Trainer4.jpg',
                      ),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rating: 3 Stars",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Upper Body and Core",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Trainer5(context) {
    return InkWell(
      onTap: () {
        showinfo(context, 5);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  Trainer1Profile(id: 5)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF660707),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                      image: ExactAssetImage
                        (
                        'lib/images/Trainer5.jpg',
                      ),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rating: 4 Star",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Full Body",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Trainer6(context) {
    return InkWell(
      onTap: () {
        showinfo(context, 6);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  Trainer1Profile(id: 6)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF660707),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                      image: ExactAssetImage
                        (
                        'lib/images/Trainer6.jpg',
                      ),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rating: 5 Star",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Legs and Glutes",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dietplan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Container(
                    width: 125.0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Text(
                  'Healthy',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Food',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(74.0)),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buidFoodItem1(),
                          SizedBox(height: 10.0),
                          _buidFoodItem2(),
                          SizedBox(height: 10.0),
                          _buidFoodItem3(),
                          SizedBox(height: 10.0),
                          _buidFoodItem4()
                        ])),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _buidFoodItem1() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                  children: [
                    Hero(
                      tag: AssetImage("lib/images/Diet01.jpg"),
                      child: Image(
                          image: AssetImage("lib/images/Diet01.jpg"),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Bowl",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "385 Calories",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {},
                )
              ])),
    );
  }

  Widget _buidFoodItem2() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                  children: [
                    Hero(
                      tag: AssetImage("lib/images/Diet1.jpg"),
                      child: Image(
                          image: AssetImage("lib/images/Diet1.jpg"),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Spring Bowl",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "440 Calories",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {},
                )
              ])),
    );
  }

  Widget _buidFoodItem3() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                  children: [
                    Hero(
                      tag: AssetImage("lib/images/Diet3.jpg"),
                      child: Image(
                          image: AssetImage("lib/images/Diet3.jpg"),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Avocado Bowl",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "561 Calories",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {},
                )
              ])),
    );
  }

  Widget _buidFoodItem4() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                  children: [
                    Hero(
                      tag: AssetImage("lib/images/Diet4.webp"),
                      child: Image(
                          image: AssetImage("lib/images/Diet4.webp"),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Berry Bowl",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "211 Calories",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {},
                )
              ])),
    );
  }
}
