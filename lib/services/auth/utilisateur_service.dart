import 'dart:convert';

import 'package:http/http.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/signup_model.dart';

class UtilisateurService {
  final url = host + '/auth';

  //SIGN UP
  Future<String> signup(String username, String email, String password) async {
    final data = jsonEncode(
        {'username': username, 'email': email, 'password': password});
    Map<String, String> headers = {"Content-Type": "application/json"};
    Response response = await post(
        Uri.parse('$url/signup'), body: data, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription ${response.statusCode} ${response.body}";
    }
  }

  //SIGN UP
  Future<String> signin(String username, String password) async {
    final data = jsonEncode(
        {'username': username, 'password': password});
    Map<String, String> headers = {"Content-Type": "application/json"};
    Response response = await post(
        Uri.parse('$url/signin'), body: data, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription ${response.statusCode} ${response.body}";
    }
  }


}