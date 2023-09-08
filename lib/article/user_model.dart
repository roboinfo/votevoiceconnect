import 'dart:convert';

List<Article> articleFromJson(String str) => List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  Article({
    required this.id,
    required this.title,
    required this.details,
    required this.featuredImageUrl,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String details;
  String featuredImageUrl;
  int categoryId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["id"],
    title: json["title"],
    details: json["details"],
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
    "featured_image_url": featuredImageUrl,
    "category_id": categoryId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
