class HotelModel {
  //converting the Url json to plain old dart objects
  final String state;
  final String url;

  HotelModel({required this.state, required this.url});

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      state: json['state'],
      url: json['url'],
    );
  }
}
