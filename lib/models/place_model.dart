//converting the place json to plain old dart objects
class Place {
  final String name;
  final String description;
  final String image;
  final String url;

  Place({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    //decode the json
    return Place(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      url: json['url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image': image,
        'url': url,
      };
}
