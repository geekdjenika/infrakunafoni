import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/extensions/diacritics.dart';
import 'package:infrakunafoni/models/categorie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CategorieService {

  var client = http.Client();
  //get all quiz
  Future<List<Categorie>> getAllCategorie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Categorie> items = [];
    String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('$host/categorie/get/all');
    var headers = {
      "Authorization": "Bearer $token"
    };
    http.Response response = await http.get(url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      print(response.body);
      print("Ăⓑỡǚ".withoutDiacritics);
      List data = jsonDecode(jsonString);
      items = data.map((e) => Categorie.fromJson(e)).toList();
    }

    return items;

  }
}