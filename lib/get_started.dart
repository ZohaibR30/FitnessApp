import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  const Color(0xFF001D4B),
//          title: const Center(child: Text('Login Page')),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50,left:50 ,right:50 ,bottom:10 ),
                child: Text(
                  "Lets Get Started ",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize:35,
                    color: Color(0xFF001D4B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 0,left:0 ,right:0,bottom: 0)),
              const Text(
                "It is never late to get started!",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF001D4B), ////
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: MaterialButton(onPressed: () {  },
                  height: 60,
                  minWidth: 300,
                  color: const Color(0xFF001D4B),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),

                  child: const Text("Signup",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: MaterialButton(onPressed: () {  },
                  height: 60,
                  minWidth: 300,
                  color: const Color(0xFF001D4B),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),

                  child: const Text("Login",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}