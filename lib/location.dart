import 'dart:convert';

import 'package:athan/model.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class LocationCity {
  static late double lat;
  static late double long;

  Future<TimeModel> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        print("'Location permissions are permanently denied");
      } else {
        print("GPS Location service is granted");
      }
    } else {
      print("GPS Location permission granted.");
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    lat = position.latitude;
    long = position.longitude;

    final url =
        "https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$long";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return TimeModel.fromJSON(json.decode(response.body));
    } else {
      print('Failed to load');
      throw Exception('Failed to Load Post');
    }
  }
}


//https://muslimsalat.com/daily.json?key=da7f38e5d29bf7634e29fd796c8bfaf6'
//https://muslimsalat.com/location/date.json?key=da7f38e5d29bf7634e29fd796c8bfaf6


// https://muslimsalat.com/latitude={$lat}&longitude={$long}.json?key=da7f38e5d29bf7634e29fd796c8bfaf6

// latitude
// longitude

//https://api.aladhan.com/v1/timings?latitude=31.956578&longitude=35.945695

//'https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$long';


// static double? lat;
  // static double? long;

  // Future<TimeModel> getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);

    // lat = position.latitude;
    // long = position.longitude;

    // String date = DateTime.now().toIso8601String();
    // int method = 4;

    // String url =
    //     //  'http://api.aladhan.com/v1/timings/$date?latitude=$lat&longitude=$long&method=$method';
    //     'https://muslimsalat.com/latitude&longitude.json?key=da7f38e5d29bf7634e29fd796c8bfaf6';
    // final response = await http.get(Uri.parse(url));
    // if (response.statusCode == 200) {
    //   return TimeModel.fromJSON(json.decode(response.body));
    // } else {
    //   print('Failed to load');
    //   throw Exception('Failed to Load Post');
    // }
    // http.Response response = await http.get(Uri.encodeFull(url),headers: {
    // })
    // list = new Data.fromJson(data);
    // return list;