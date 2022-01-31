import 'package:flutter/material.dart';
import './signup.dart';
import './home.dart';
import './recover_pass.dart';
import 'Entity/user_signup.dart';
import 'Services/services_user_signup.dart';
import 'Services/trainer_info.dart';
import 'Entity/Trainer.dart';
import 'globals.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  List<Trainer> trainers = [];
  late Trainer train;

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void userexistincorrectpassword(BuildContext context) {
    var alertdialog = AlertDialog(
        title: Text("User Already Exist But Incorrect Password"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }

  void userdoesnotexist(BuildContext context) {
    var alertdialog = AlertDialog(
        title: Text("User Does Not Exist"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }

  @override

  List<User_Signup> userinformation = [];

  void loginUser(context) {
    Services_user_signup.loginUser(
            usernameController.text, passwordController.text)
        .then((result) {
      if (result == 'user existPassword Verified!') {
        print("done");
        Global.username = usernameController.text;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );
      }
      if (result == 'user existIncorrect Password!') {
        print("user already exist but incorrect password");
        userexistincorrectpassword(context);
      }
      if (result == 'User Does Not Exist') {
        print("User Does Not Exist");
        userdoesnotexist(context);
      }
    });

    Services_user_signup.getUser(usernameController.text).then(
          (user_data) {
        userinformation = user_data;

        String email = (userinformation.map((e) => e.email)).toString();
        String username = (userinformation.map((e) => e.username)).toString();
        String password = (userinformation.map((e) => e.password)).toString();
        String age = (userinformation.map((e) => e.age)).toString();
        String weight = (userinformation.map((e) => e.weight)).toString();
        String height = (userinformation.map((e) => e.height)).toString();
        String bmi = (userinformation.map((e) => e.bmi)).toString();
        String User_Calorie = (userinformation.map((e) => e.User_Calorie)).toString();
        String workout_time = (userinformation.map((e) => e.workout_time)).toString();

        email = email.replaceAll(RegExp(r'[(,)]'), '');
        username = username.replaceAll(RegExp(r'[(,)]'), '');
        password = password.replaceAll(RegExp(r'[(,)]'), '');
        age = age.replaceAll(RegExp(r'[(,)]'), '');
        weight = weight.replaceAll(RegExp(r'[(,)]'), '');
        height = height.replaceAll(RegExp(r'[(,)]'), '');
        bmi = bmi.replaceAll(RegExp(r'[(,)]'), '');
        User_Calorie = User_Calorie.replaceAll(RegExp(r'[(,)]'), '');
        workout_time = workout_time.replaceAll(RegExp(r'[(,)]'), '');

        Global.User_Calorie = User_Calorie;
        Global.email = email;
        Global.username = username;
        Global.password = password;
        Global.age = age;
        Global.weight = weight;
        Global.height = height;
        Global.bmi = bmi;
        Global.workout_time = workout_time;
      },
    );
  }

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
                  "Welcome Back",
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
                    top: 30, right: 10, left: 10, bottom: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: MaterialButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  height: 60,
                  minWidth: 250,
                  color: const Color(0xFF001D4B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (context) => const Recover()),
                  );
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
                  onPressed: () {
                    Navigator.push(
                      ctx,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: const Text("Don't Have an Account? Signup"),
                  style: TextButton.styleFrom(
                    primary: Colors.blue[900],
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF001D4B),
                    ),
                    padding: const EdgeInsets.only(top: 10),
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
