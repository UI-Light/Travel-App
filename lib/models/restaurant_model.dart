class RestaurantModel {
  //converting the Url json to plain old dart objects
  final String state;
  final String url;

  RestaurantModel({required this.state, required this.url});

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      state: json['state'],
      url: json['url'],
    );
  }
}
