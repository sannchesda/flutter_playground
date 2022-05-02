// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

User userModelFromJson(String str) => User.fromJson(json.decode(str));

String userModelToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
