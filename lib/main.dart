import 'package:flutter/material.dart';

//import 'package:flutter/painting.dart';
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
          backgroundColor: const Color(0xFF001D4B),
         // title: const Center(child: Text('Signup')),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
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
                    top: 60, right: 10, left: 10, bottom: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.mail_outlined),
                      labelText: 'Email Address'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 30, right: 10, left: 10, bottom: 20),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.mail_outlined),
                      labelText: 'User Name'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, left: 10, bottom: 20),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, left: 10, bottom: 20),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password'),
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

                  child: const Text("Signup",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 1.5,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Already have an account? Sign in."),
                style: TextButton.styleFrom(
                  primary: Colors.blue[900],
                  textStyle: const TextStyle(fontSize: 15),
                  padding: const EdgeInsets.only(top: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


