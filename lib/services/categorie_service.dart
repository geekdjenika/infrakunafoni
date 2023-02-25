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
      List<Categorie> items = [];
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      List data = json.decode(utf8.decode(jsonByte));
      print(data);
      //List data = jsonDecode(jsonString);
      items = data.map((e) => Categorie.fromJson(e)).toList();
      print('Cta 1');
      print(items[0].amendes![0].infractions!.length);
      print(items[0].amendes![1].infractions!.length);
      print('Cta 2');
      print(items[1].amendes![0].infractions!.length);
      print(items[1].amendes![1].infractions!.length);
      print('Cta 3');
      print(items[2].amendes![0].infractions!.length);
      print(items[2].amendes![1].infractions!.length);
      print('Cta 4');
      print(items[3].amendes![0].infractions!.length);
      print(items[3].amendes![1].infractions!.length);
      return items;
    } else {
      throw ("Liste introuvable : ${response.body}");
    }




  }
}
