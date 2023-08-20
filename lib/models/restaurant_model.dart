class Url {
  //converting the Url json to plain old dart objects
  final String url;

  Url({required this.url});

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(url: json['url']);
  }
}

class StateRestaurantUrl {
  final List<Url> urlR;

  StateRestaurantUrl({required this.urlR});

  factory StateRestaurantUrl.fromJson(Map<String, dynamic> json) {
    return StateRestaurantUrl(urlR: json['url']);
  }
}
