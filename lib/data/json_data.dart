import 'dart:convert';
import "dart:async";
import 'package:http/http.dart' as http;
import 'package:travel_demo/models/state_model.dart';
import 'package:flutter/services.dart' show rootBundle;

//class ReadJsonFile {
// Future<States> getPlaces() async {
//   final response =
//       await http.get(Uri.parse("http://192.168.164.242/assets/places.json"));
//   if (response.statusCode == 200) {
//     return States.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load places');
//   }
// }

class ReadJsonData {
  Future<String> _loadPlaceAsset() async {
    return await rootBundle.loadString('assets/places.json');
  }

  Future<States> loadPlace() async {
    String jsonString =
        await _loadPlaceAsset(); //loading json String from the assets
    final jsonResponse = json.decode(jsonString); //Decoding the raw json String
    States placeInState = States.fromJson(jsonResponse);
    print(placeInState.places);
    return placeInState;
  }
}
