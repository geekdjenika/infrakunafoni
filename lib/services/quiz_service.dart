import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infrakunafoni/models/quiz_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
class QuizService {
  var client = http.Client();
  //get all quiz
  Future<List<Quiz>> getAllQuiz() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('$host/quiz/get/all');
    var headers = {
      "Authorization": "Bearer $token"
    };
    http.Response response = await http.get(url,
      headers: headers,
    );
    print("j'entre dans if");
    if (response.statusCode == 200) {
      List<Quiz> items = [];
      //get the data from the response
      String jsonString = response.body;
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      List data = json.decode(utf8.decode(jsonByte));
      //Convert to List<Map>
      //List data = jsonDecode(jsonString);

      print(data);
      items = data.map((e) => Quiz.fromJson(e)).toList();
      return items;
    } else {
      throw ("Liste introuvable : ${response.body}");
    }



  }

  //Add session
  Future<String> addSession(int idQuiz, int point) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('$host/quiz/score/add/$idQuiz/${prefs.getInt("id")}');
    final data = jsonEncode(
        {
          'points' : point
        });
    var headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };
    var response = await client.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      connexion = true;
      return json['points'].toString();
    } else {
      //throw ("Can't get the Articles");
      return "Score non ajouté ${response.statusCode} ${response.body} !";
    }
  }

}
