import 'package:travel_demo/models/place_model.dart';

//converting the stateModel json to plain old dart objects
class StateModel {
  final String stateModelName;
  final List<Place> places;

  StateModel({
    required this.stateModelName,
    required this.places,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    var listP = json['places'] as List;

    List<Place> placesList = listP.map((i) => Place.fromJson(i)).toList();

    return StateModel(
      stateModelName: json['name'],
      places: placesList,
    );
  }
}
