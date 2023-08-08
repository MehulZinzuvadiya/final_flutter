import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/home_model.dart';
import '../Model/verse_model.dart';

class ApiHelper {
  static final apiHelper = ApiHelper._();

  ApiHelper._();

  Future<List<dynamic>> getApi() async {
    String link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/";
    var response = await http.get(Uri.parse(link), headers: {
      "X-RapidAPI-Key": "e1ce1db1b6mshd5301ab816f5ff7p133682jsnd4862ef0f16d",
      "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com",
    });
    var json = jsonDecode(response.body);
    return json.map((e) => HomeModel.fromJson(e)).toList();
  }

  Future<List<dynamic>> getApi2() async {
    String link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/1/verses/";
    var response = await http.get(Uri.parse(link), headers: {
      "X-RapidAPI-Key": "e1ce1db1b6mshd5301ab816f5ff7p133682jsnd4862ef0f16d",
      "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com",
    });
    var json = jsonDecode(response.body);
    return json.map((e) => VerseModel.fromJson(e)).toList();
  }
}
