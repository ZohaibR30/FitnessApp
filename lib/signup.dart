import 'package:flutter/material.dart';
import './login.dart';
import 'Services/services_user_signup.dart';
import 'getstarted.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  @override
  void userexist(BuildContext context) {
    var alertdialog = AlertDialog(title: Text("User Already Exist"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }

  void passwordLength(BuildContext context) {
    var alertdialog =
        AlertDialog(title: Text("Password should be of 8 characters"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }

  void addUser(context) {
    if (passwordController.text.length < 8) {
      passwordLength(context);
    }

    else {
      Services_user_signup.addUser(
              emailController.text,
              usernameController.text,
              passwordController.text,
              ageController.text,
              heightController.text,
              weightController.text)
          .then((result) {
        if (result == 'success') {
          print("done");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Start()),
          );
        }
        if (result == 'useralreadyexist') {
          print("user already exist");
          userexist(context);
        }
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
      builder: (ctx) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF001D4B),
          // title: const Center(child: Text('Signup')),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1,
                    color: Color(0xFF001D4B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF001D4B),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 50, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.mail_outlined),
                      labelText: 'Email Address'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.mail_outlined),
                      labelText: 'User Name'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.only(
              //       top: 10, right: 10, left: 10, bottom: 10),
              //   child: const TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'Confirm Password',
              //         hintText: 'Confirm Password'),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height',
                      hintText: 'Enter Height'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight',
                      hintText: 'Enter your Weight'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 10),
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                      hintText: 'Enter your Age'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: MaterialButton(
                  onPressed: () {
                    addUser(context);
                  },
                  height: 60,
                  minWidth: 250,
                  color: const Color(0xFF001D4B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text("Already have an account? Sign in."),
                style: TextButton.styleFrom(
                  primary: Colors.blue[900],
                  textStyle: const TextStyle(fontSize: 15),
                  padding: const EdgeInsets.only(top: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
