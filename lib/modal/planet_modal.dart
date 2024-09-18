class Planet {
  final String id;
  final String imagePath;
  final String name;
  final String shortInfo;

  Planet(
      {required this.id,
      required this.imagePath,
      required this.name,
      required this.shortInfo});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      id: json['id'],
      imagePath: json['imagePath'],
      name: json['name'],
      shortInfo: json['shortInfo'],
    );
  }
}
