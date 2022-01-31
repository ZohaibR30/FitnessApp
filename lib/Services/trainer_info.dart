import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signupp/Entity/Trainer.dart';
import 'dart:math';

class trainer_info {
  static const root = 'http://172.16.73.38/FitnessApp/trainer.php';
  static const SIGNUP_USER_ACTION = 'ADD_USER_SIGNUP';
  static const LOGIN_USER_ACTION = 'LOGIN_USER_ACTION';
  static const GET_ALL_INFO = 'GET_ALL_FROM_TABLE';

  static List<Trainer> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Trainer>((json) => Trainer.fromJson(json)).toList();
  }

  static Future<List<Trainer>> getTrainer(int id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_ALL_INFO;
      map['id'] = id.toString();

      final response = await http.post(Uri.parse(root), body: map);
      print("Get Trainers Table Response: ${response.body}");
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<Trainer> list = parseResponse(response.body);
        return list;
      } else {
        return <Trainer>[];
      }
    } catch (e) {
      return <Trainer>[]; //RETURN EMPTY LIST ON EXCEPTION
    }
  }
}
