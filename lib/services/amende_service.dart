import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmendeService {
  var client = http.Client();
  //get all quiz
  Future<List<Amende>> getAllAmende() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Amende> items = [];
    String? token = prefs.getString("token");
    //Get the item from the API
    var url = Uri.parse('$host/amende/get/all');
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
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      List data = json.decode(utf8.decode(jsonByte));
      //List data = jsonDecode(jsonString);
      items = data.map((e) => Amende.fromJson(e)).toList();


    }

    return items;


  }
}
