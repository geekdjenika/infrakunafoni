import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infrakunafoni/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      //prefs.setString("profil", json['image']);
      id = json['id'];
      print("mon id");
      print(id);
      connexion = true;
      return "Bienvenue ${json['username']} !".toUpperCase();

    } else {
      //throw ("Can't get the Articles");
      return "Nom d'utilisateur ou mot de passe incorrect !";
    }
  }
  //Get user
  Future<Map<String,dynamic>> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? UID = prefs.getInt("id");
    Map<String,dynamic> item = {};

    String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('$host/user/$UID');
    var headers = {
      "Authorization": "Bearer $token"
    };
    http.Response response = await http.get(url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;

      //Convert to List<Map>
      item = jsonDecode(jsonString);
      prefs.setString("profil", item['image']);
    }

    return item;
  }
  /*static Future<List<Utilisateur>> getUser(int idU) async{
    var url = Uri.parse('$host/user/$idU');
    var headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqZXJlbWkiLCJpYXQiOjE2NzYzNjQwODMsImV4cCI6MTY3NjQ1MDQ4M30.n5LYUg91OUzenWp-W1J6xE3AkRPScYmI12bjNSl7v4VZ-tkVqcDX-eeQuACBbV0dctwWXjoLmt5ItZaeYwMKTQ"
    };
    http.Response response = await http.get(url,
      headers: headers,
    );


    List responseList = json.decode(response.body) as List<dynamic>;
    print(responseList);
    final List<dynamic> jsonResponse = json.decode(response.body);
    print("mon json");
    print(jsonResponse);
    return jsonResponse.map((utilisateur) => Utilisateur.fromJson(utilisateur)).toList();
    *//*List<Utilisateur> utilisateurs = [];
    for (Map utilisateurMap in responseList){
      print(responseList);
      Utilisateur utilisateur = Utilisateur.fromMap(utilisateurMap);
      utilisateurs.add(utilisateur);
    }*//*

    //return utilisateurs;
  }*/
  /*Future<Utilisateur> getUser(int idU) async {
    var url = Uri.parse('$baseUrl/api/user/1');
    var _headers = {
      "Authorization": "Bearer $token"
    };
    var response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print(response.body);
      var body = json['data'];
      photo = json['image'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      Utilisateur utilisateur = body.map((dynamic item) => Utilisateur.fromJson(item)).toList();
      print("Mon utilisateur");
      print(utilisateur);
      return utilisateur;
    } else {
      //return res.statusCode;
      throw ("Utilisateur introuvable ! ${response.statusCode}");
    }
  }*/

  /*final response = await http.get(uri, headers: {
    "x-rapidapi-key": "YOUR API KEY FROM YUMMLY API",
    "x-rapidapi-host": "yummly2.p.rapidapi.com",
    "useQueryString": "true"
  });}*/

}