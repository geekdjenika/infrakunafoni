import 'dart:convert';

import 'package:http/http.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/signup_model.dart';

class UtilisateurService {
  final url = host + '/auth';

  //SIGN UP
  Future<String> signup(SignUp signUp) async {
    Response response = await post(
        Uri.parse('$url/signup'), body: signUp.toJson());

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription";
    }
  }

}