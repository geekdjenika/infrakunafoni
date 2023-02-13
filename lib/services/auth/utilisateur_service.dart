import 'dart:convert';

import 'package:http/http.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/signup_model.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';

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
      connexion = true;
      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de la connexion ${response.statusCode} ${response.body}";
    }
  }

  Future<Utilisateur> getUser() async {

    Response res = await get(Uri.parse('$host/api/user/1'), headers: {
      "Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnZWVrZGplbmlrYSIsImlhdCI6MTY3NjA1MzAzMywiZXhwIjoxNjc2MTM5NDMzfQ.hs-rh5f_h9o8Q6Lv_Qt66v4cN0_5ntbGrUGa89A_MB2fyFRKp3KfspNf4PW6Pywqbwli86kedppSqOe8ZA3Ppw"
    });

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      var body = json['data'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      Utilisateur utilisateur =
      body.map((dynamic item) => Utilisateur.fromJson(item)).toList();

      return utilisateur;
    } else {
      //return res.statusCode;
      throw ("Can't get the User");
    }
  }

  /*final response = await http.get(uri, headers: {
    "x-rapidapi-key": "YOUR API KEY FROM YUMMLY API",
    "x-rapidapi-host": "yummly2.p.rapidapi.com",
    "useQueryString": "true"
  });}*/

}