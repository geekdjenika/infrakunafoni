import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/conseil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ConseilService {
  var client = http.Client();
  //get all quiz
  Future<List<Conseil>> getAllConseil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Conseil> items = [];
    String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('$host/conseil/get/all');
    var headers = {
      "Authorization": "Bearer $token"
    };
    http.Response response = await http.get(url,
      headers: headers,
    );
    print('Je vais essayer');
    print(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      print(response.body);
      List data = jsonDecode(jsonString);
      items = data.map((e) => Conseil.fromJson(e)).toList();
    }

    return items;

  }
}