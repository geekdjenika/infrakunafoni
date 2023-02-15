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
    List<Quiz> items = [];
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
      print(response.body);
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      List data = jsonDecode(jsonString);
      print("mes data");
      print(data);
      items = data.map((e) => Quiz.fromJson(e)).toList();
      print("je suis là");
      print(response.body);
    }
    print(response.body);
    print("je sors");

    return items;

  }

}