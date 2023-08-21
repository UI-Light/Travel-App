class HotelUrl {
  //converting the Url json to plain old dart objects
  final String state;
  final String url;

  HotelUrl({required this.state, required this.url});

  factory HotelUrl.fromJson(Map<String, dynamic> json) {
    return HotelUrl(
      state: json['state'],
      url: json['url'],
    );
  }
}

class StateHotelUrl {
  final List<HotelUrl> urlH;

  StateHotelUrl({required this.urlH});

  factory StateHotelUrl.fromJson(Map<String, dynamic> json) {
    return StateHotelUrl(urlH: json['url']);
  }
}
