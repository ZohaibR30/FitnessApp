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
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize:35,
                    color: Color(0xFF001D4B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF001D4B), ////
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 100, right: 10, left: 10, bottom: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.mail_outlined),
                      labelText: 'User Name'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 30, right: 10, left: 10, bottom: 20),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: MaterialButton(onPressed: () {

                },
                  height: 60,
                  minWidth: 250,
                  color: const Color(0xFF001D4B),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),

                  child: const Text("Login",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),
              TextButton(
                onPressed: () {
                  //what to do when pressed
                  //
                },
                child: const Text('Forgot Password'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Don't Have an Account? Signup"),
                  style: TextButton.styleFrom(
                    primary: Colors.blue[900],
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color:  Color(0xFF001D4B),
                    ),
                    padding: const EdgeInsets.only(top: 10),
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


