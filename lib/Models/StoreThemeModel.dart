import 'dart:convert';

class StoreThemeModel {
  String image;
  String name;
  StoreThemeModel(this.image, this.name);

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }

  factory StoreThemeModel.fromMap(Map<String, dynamic> map) {
    return StoreThemeModel(
      map['image'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreThemeModel.fromJson(String source) =>
      StoreThemeModel.fromMap(json.decode(source));
}
