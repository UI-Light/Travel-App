import 'package:travel_demo/models/place_model.dart';

//converting the state json to plain old dart objects
class States {
  final String stateName;
  final List<Place> places;

  States({
    required this.stateName,
    required this.places,
  });

  factory States.fromJson(Map<String, dynamic> json) {
    var listP = json['places'] as List;

    List<Place> placesList = listP.map((i) => Place.fromJson(i)).toList();

    return States(
      stateName: json['name'],
      places: placesList,
    );
  }
}
