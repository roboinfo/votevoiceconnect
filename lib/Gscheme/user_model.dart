// To parse this JSON data, do
//
//     final scheme = schemeFromJson(jsonString);

import 'dart:convert';

List<Scheme> schemeFromJson(String str) => List<Scheme>.from(json.decode(str).map((x) => Scheme.fromJson(x)));

String schemeToJson(List<Scheme> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Scheme {
  int id;
  String title;
  String details;
  String link;
  String featuredImageUrl;
  int categoryId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Scheme({
    required this.id,
    required this.title,
    required this.details,
    required this.link,
    required this.featuredImageUrl,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Scheme.fromJson(Map<String, dynamic> json) => Scheme(
    id: json["id"],
    title: json["title"],
    details: json["details"],
    link: json["link"],
    featuredImageUrl: json["featured_image_url"],
    categoryId: json["category_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "details": details,
    "link": link,
    "featured_image_url": featuredImageUrl,
    "category_id": categoryId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
