class RestaurantUrl {
  //converting the Url json to plain old dart objects
  final String state;
  final String url;

  RestaurantUrl({required this.state, required this.url});

  factory RestaurantUrl.fromJson(Map<String, dynamic> json) {
    return RestaurantUrl(
      state: json['state'],
      url: json['url'],
    );
  }
}

class StateRestaurantUrl {
  final List<RestaurantUrl> urlR;

  StateRestaurantUrl({required this.urlR});

  factory StateRestaurantUrl.fromJson(Map<String, dynamic> json) {
    return StateRestaurantUrl(urlR: json['url']);
  }
}
