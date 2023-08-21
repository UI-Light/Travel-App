import 'dart:convert';
import "dart:async";
import 'package:travel_demo/models/hotel_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:travel_demo/models/state_model.dart';

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

  Future<List<HotelRestaurantModel>> loadHotels() async {
    String jsonString =
        await rootBundle.loadString('assets/stateHotelUrl.json');
    final jsonResponse = json.decode(jsonString);
    var hotels = jsonResponse['hotelUrl'];
    List<HotelRestaurantModel> hotelsList = List<HotelRestaurantModel>.from(
        hotels.map((i) => HotelRestaurantModel.fromJson(i)));
    return hotelsList;
  }

  Future<List<HotelRestaurantModel>> loadRestaurants() async {
    String jsonString =
        await rootBundle.loadString('assets/stateRestaurants.json');
    final jsonResponse = json.decode(jsonString);
    var restaurant = jsonResponse['restaurantUrl'];
    List<HotelRestaurantModel> restaurantList = List<HotelRestaurantModel>.from(
        restaurant.map((i) => HotelRestaurantModel.fromJson(i)));
    return restaurantList;
  }
}
