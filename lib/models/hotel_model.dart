class HotelRestaurantModel {
  //converting the Url json to plain old dart objects
  final String state;
  final String url;

  HotelRestaurantModel({required this.state, required this.url});

  factory HotelRestaurantModel.fromJson(Map<String, dynamic> json) {
    return HotelRestaurantModel(
      state: json['state'],
      url: json['url'],
    );
  }
}
