import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wether_api/screen/wether/modal/wether_modal.dart';

class ApiHelper
{
  Future<Country> countryApiCall({String? coun, String? cat})
  async{
    String link="https://newsapi.org/v2/top-headlines?country=$coun&category=$cat&apiKey=39920e07d0244fbd83f4e3c889d091ad";
    Uri uri=Uri.parse(link);
    var response=  await http.get(uri);
    var json=jsonDecode(response.body);

    Country country =Country.fromJson(json);
    return country;



  }
}