import 'dart:convert';

import 'package:http/http.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/signup_model.dart';

class UtilisateurService {
  final url = host + '/auth';

  //SIGN UP
  Future<String> signup(String username, String email, String password) async {
    Map data = {
      'username'= username
    }
    var body = jsonEncode(signUp);
    Response response = await post(
        Uri.parse('$url/signup'), body: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription ${response.statusCode} ${response.body}";
    }
  }

}