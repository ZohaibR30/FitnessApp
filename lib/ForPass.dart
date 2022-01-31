import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'home.dart';
import 'globals.dart';
import 'Services/services_user_signup.dart';
import 'getstarted.dart';

class ForPass extends StatelessWidget {
  var _username = Global.username;
  TextEditingController passwordController = new TextEditingController();

  void passwordLength(BuildContext context) {
    var alertdialog =
        AlertDialog(title: Text("Password should be of 8 characters"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }

  void changePassword(context) {
    if (passwordController.text.length < 8) {
      passwordLength(context);
    } else {
      Services_user_signup.changePassword(_username, passwordController.text)
          .then((result) {
        if (result == 'success') {
          print("Password Changed Successful");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Start()),
          );
        }
        if (result == 'error') {
          print("Password Cannot Be Changed");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
      builder: (ctx) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF001D4B),
//          title: const Center(child: Text('Login Page')),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 35,
                    color: Color(0xFF001D4B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text(
                "Enter New Password",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF001D4B), ////
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 100, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: passwordController,
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
                      labelText: 'Re-enter Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: MaterialButton(
                  onPressed: () {
                    changePassword(context);
                  },
                  height: 60,
                  minWidth: 250,
                  color: const Color(0xFF001D4B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "Change",
                    style: TextStyle(
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
    ));
  }
}
