import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_demo/models/place_model.dart';

class Database {
  static const _key = "places";
  static SharedPreferences? _prefs;

  ///Initializes shared preferences if not already initialized
  static Future<void> _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  ///Saves a place to the database
  static Future<void> savePlace(Place place) async {
    await _init();
    List<Place> places = await getPlaces(); //retrieves all the places
    places.add(place); //add the new place

    final placesJson = places.map((e) => e.toJson());
    final result = {};
    result["places"] = placesJson.toList();
    await _prefs!
        .setString(_key, json.encode(result)); //save modified list of places
  }

  ///Saves a place to the database
  static Future<void> removePlace(Place place) async {
    await _init();
    List<Place> places = await getPlaces(); //retrieves all the places
    places.removeWhere((e) => e.url == place.url); //remove the requested place
    final placesJson = places.map((e) => e.toJson());
    print(placesJson);

    final result = {};
    result["places"] = placesJson.toList();
    await _prefs!
        .setString(_key, json.encode(result)); //save modified list of places
  }

  static Future<List<Place>> getPlaces() async {
    await _init();
    final result = Map<String, dynamic>.from(json.decode(
        _prefs!.getString(_key) ??
            '{"places": []}')); //retrieves json version of places

    return List<Place>.from(result['places']
        .map((e) => Place.fromJson(e))); //converts json to List of places
  }

  static Future<Place?> getPlace(String url) async {
    try {
      await _init();
      final places = await getPlaces(); //gets places
      return places
          .where((place) => place.url == url)
          .first; //finds specific place that matches the Url
    } catch (e) {}
  }
}
