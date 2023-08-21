import 'dart:convert';
import "dart:async";
import 'package:http/http.dart' as http;
import 'package:travel_demo/models/hotel_model.dart';
import 'package:travel_demo/models/restaurant_model.dart';
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

  Future<List<StateModel>> loadPlaces() async {
    String jsonString =
        await _loadPlaceAsset(); //loading json String from the assets
    final jsonResponse = json.decode(jsonString); //Decoding the raw json String
    var states = jsonResponse['states'] as List;

    List<StateModel> statesList =
        states.map((i) => StateModel.fromJson(i)).toList();
    return statesList;
  }

  Future<List<HotelModel>> loadHotels() async {
    String jsonString =
        await rootBundle.loadString('assets/stateHotelUrl.json');
    final jsonResponse = json.decode(jsonString);
    var hotels = jsonResponse['hotelUrl'];
    List<HotelModel> hotelsList =
        hotels.map((i) => HotelModel.fromJson(i)).toList();
    return hotelsList;
  }

  Future<List<RestaurantModel>> loadRestaurants() async {
    String jsonString =
        await rootBundle.loadString('assets/stateRestaurants.json');
    final jsonResponse = json.decode(jsonString);
    var restaurant = jsonResponse['restaurantUrl'];
    List<RestaurantModel> restaurantList =
        restaurant.map((i) => RestaurantModel.fromJson(i)).toList();
    return restaurantList;
  }
}
