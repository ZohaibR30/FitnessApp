import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signupp/Entity/user_signup.dart';
import 'dart:math';

//import 'user_signup.dart';

class Services_user_signup {
  static const root = 'http://172.16.73.38/FitnessApp/fitness.php';
  static const SIGNUP_USER_ACTION = 'ADD_USER_SIGNUP';
  static const LOGIN_USER_ACTION = 'LOGIN_USER_ACTION';
  static const GET_ALL_INFO = 'GET_ALL_FROM_TABLE';
  static const CHANGE_PASSWORD = 'CHANGE_PASSWORD';
  static const DELETE_USER = 'DELETE_USER';
  static const UPDATE_WORKOUT_TIME = 'UPDATE_WORKOUT_TIME';

  static List<User_Signup> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<User_Signup>((json) => User_Signup.fromJson(json))
        .toList();
  }

  static Future<String> addUser(String email, String username, String password,
      String age, String height, String weight) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SIGNUP_USER_ACTION;
      map['email'] = email;
      map['username'] = username;
      map['password'] = password;
      map['age'] = age;
      map['height'] = height;
      map['weight'] = weight;
      double bmi;
      bmi = double.parse(weight) / pow(double.parse(height) / 100, 2);
      map['bmi'] = bmi.toStringAsFixed(1);
      double calorie;
      calorie = ((double.parse(weight) * 2.2 * 6.23) +
              (double.parse(height) / .39) * 12.7 -
              (int.parse(age) * 6.8) +
              66) *
          1.55;
      map['calorie'] = calorie.toStringAsFixed(1);
      int workout_time = 0;
      map['workout_time'] = workout_time.toString();
      final response = await http.post(Uri.parse(root), body: map);

      print(response.body);

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> loginUser(String username, String password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = LOGIN_USER_ACTION;
      map['username'] = username;
      map['password'] = password;
      final response = await http.post(Uri.parse(root), body: map);

      print(response.body);

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<User_Signup>> getUser(String username) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_ALL_INFO;
      map['username'] = username;

      final response = await http.post(Uri.parse(root), body: map);
      print("Get Trainers Table Response: ${response.body}");
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<User_Signup> list = parseResponse(response.body);
        return list;
      } else {
        return <User_Signup>[];
      }
    } catch (e) {
      return <User_Signup>[]; //RETURN EMPTY LIST ON EXCEPTION
    }
  }

  static Future<String> changePassword(String username, String password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = CHANGE_PASSWORD;
      map['username'] = username;
      map['password'] = password;

      final response = await http.post(Uri.parse(root), body: map);
      print(response.body);
      print(response.statusCode);

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; //RETURN EMPTY LIST ON EXCEPTION
    }
  }

  static Future<String> deleteUser(String username) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = DELETE_USER;
      map['username'] = username;

      final response = await http.post(Uri.parse(root), body: map);
      print(response.body);
      print(response.statusCode);

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; //RETURN EMPTY LIST ON EXCEPTION
    }
  }


  static Future<String> updateWorkoutTime(String username, String workout_time) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = UPDATE_WORKOUT_TIME;
      map['username'] = username;
      map['workout_time'] = workout_time;

      final response = await http.post(Uri.parse(root), body: map);
      print(response.body);
      print(response.statusCode);

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; //RETURN EMPTY LIST ON EXCEPTION
    }
  }
}
