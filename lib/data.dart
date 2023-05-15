import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_city_api/models/models.dart';

class ApiService {
  Future<City?> fetchApi() async {
    http.Response response = await http
        .get(Uri.parse("http://sjf.proximys.in/api/cities/list-all/"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final cityList = City.fromJson(jsonData);

      return cityList;
    } else {}
  }
}
