import 'dart:math';

class User_Signup {
  String email;
  String username;
  String password;
  String age;
  String weight;
  String height;
  String bmi;
  String User_Calorie;
  String workout_time;

  User_Signup(
      {required this.email,
      required this.username,
      required this.password,
      required this.age,
      required this.weight,
      required this.height,
      required this.bmi,
      required this.workout_time,
      required this.User_Calorie});

  factory User_Signup.fromJson(Map<String, dynamic> json) {
    return User_Signup(
        username: json['Username'] as String,
        password: json['Password'] as String,
        email: json['Email'] as String,
        age: json['Age'] as String,
        weight: json['Weight'] as String,
        height: json['Height'] as String,
        User_Calorie: json['User_Calorie'] as String,
        bmi: json['BMI'] as String,
        workout_time: json['workout_time'] as String);
  }
}
