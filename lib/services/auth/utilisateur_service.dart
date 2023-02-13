import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infrakunafoni/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';

class UtilisateurService {
  final baseUrl = '$host/auth';
  var client = http.Client();

  //SIGN UP
  Future<String> signup(String username, String email, String password) async {
    var url = Uri.parse('$baseUrl/signup');
    final data = jsonEncode(
        {'username': username, 'email': email, 'password': password});
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await client.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      connexion = true;
      return json['message'];
    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de l'inscription ${response.statusCode} ${response.body}";
    }
  }

  //SIGN IN
  Future<String> signin(String username, String password) async {
    var url = Uri.parse('$baseUrl/signin');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(
        {'username': username, 'password': password});
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await client.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      prefs.setBool("loggedIn", true);
      connecte = true;
      Map<String, dynamic> json = jsonDecode(response.body);
      prefs.setString("token", json['accessToken']);
      token = json['accessToken'];
      prefs.setInt("id", json['id']);
      id = json['id'];
      connexion = true;
      return "Bienvenue ${json['username']} !".toUpperCase();

    } else {
      //throw ("Can't get the Articles");
      return "Problème lors de la connexion ${response.statusCode} ${response.body}";
    }
  }
  //Get user
  Future<Utilisateur> getUser() async {
    var url = Uri.parse('$baseUrl/api/user/$id');
    var _headers = {
      "Authorization": "Bearer $token"
    };
    var response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      var body = json['data'];
      photo = json['image'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      Utilisateur utilisateur = body.map((dynamic item) => Utilisateur.fromJson(item)).toList();

      return utilisateur;
    } else {
      //return res.statusCode;
      throw ("Utilisateur introuvable ! ${response.statusCode}");
    }
  }

  /*final response = await http.get(uri, headers: {
    "x-rapidapi-key": "YOUR API KEY FROM YUMMLY API",
    "x-rapidapi-host": "yummly2.p.rapidapi.com",
    "useQueryString": "true"
  });}*/

}