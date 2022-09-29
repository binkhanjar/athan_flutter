import 'dart:convert';

import 'package:athan/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<TimeModel> getTime() async {
    String url =
        'https://api.aladhan.com/v1/timings?latitude=51.508515&longitude=-0.1254872&method=2';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return TimeModel.fromJSON(json.decode(response.body));
    } else {
      print('Failed to load');
      throw Exception('Failed to Load Post');
    }
  }
}
