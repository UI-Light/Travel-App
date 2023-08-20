class Url {
  //converting the Url json to plain old dart objects
  final String url;

  Url({required this.url});

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(url: json['url']);
  }
}

class StateHotelUrl {
  final List<Url> urlH;

  StateHotelUrl({required this.urlH});

  factory StateHotelUrl.fromJson(Map<String, dynamic> json) {
    return StateHotelUrl(urlH: json['url']);
  }
}
