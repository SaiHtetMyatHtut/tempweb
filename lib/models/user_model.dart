import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.gameName,
    required this.id,
    required this.name,
    required this.typeName,
  });

  String gameName;
  int id;
  String name;
  String typeName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        gameName: json["game_name"],
        id: json["id"],
        name: json["name"],
        typeName: json["type_name"],
      );

  Map<String, dynamic> toJson() => {
        "game_name": gameName,
        "id": id,
        "name": name,
        "type_name": typeName,
      };
}
