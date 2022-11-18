import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/src/client.dart';
import 'package:search_app/model/ninja_model.dart';

class NinjaApi {
  static Client client = http.Client();
  static const String _url =
      "https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises?muscle=biceps";

  static Future<List<NinjaModel>> getNinjaData() async {
    List<NinjaModel> _list = [];
    //veriler alındı
    var result = await client.get(Uri.parse(_url), headers: {
      'X-RapidAPI-Key': '18d34eedc7mshb46134899bc3d55p19f4bdjsnbffc5fcfae71',
      'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
    });
    var ninjaList = jsonDecode(result.body);

    if (ninjaList is List) {
      _list = ninjaList.map((e) => NinjaModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
