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
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30,right: 0,left: 0,bottom:5 ),

                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize:35,
                      color: Color(0xFF001D4B),
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10,left: 40,right:30, bottom:0),
                  child: Text(
                      "In order to protect your account, make sure your password "
                          "is longer than 7 characters",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF001D4B),
                  fontSize: 15,
                ),
                  ),

                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 10)),

              Container(
                padding: const EdgeInsets.only(
                    top: 100, right: 10, left: 10, bottom: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.mail_outlined),
                      labelText: 'New Password'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 30, right: 10, left: 10, bottom: 20),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-enter new password',
                      hintText: 'Re-enter new Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: MaterialButton(onPressed: () {  },
                  height: 60,
                  minWidth: 250,
                  color: const Color(0xFF001D4B),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),

                  child: const Text("Change Password",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
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