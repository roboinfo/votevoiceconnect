// import 'dart:convert';
//
// List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
//
// String postToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class UserModel {
//   UserModel({
//     required this.id,
//     required this.title,
//     required this.details,
//     required this.featuredImageUrl,
//     required this.categoryId,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.category,
//   });
//
//   int id;
//   String title;
//   String details;
//   String featuredImageUrl;
//   int categoryId;
//   int userId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Category category;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     id: json["id"],
//     title: json["title"],
//     details: json["details"],
//     featuredImageUrl: json["featured_image_url"],
//     categoryId: json["category_id"],
//     userId: json["user_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     category: Category.fromJson(json["category"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "details": details,
//     "featured_image_url": featuredImageUrl,
//     "category_id": categoryId,
//     "user_id": userId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "category": category.toJson(),
//   };
// }
//
// class Category {
//   Category({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String name;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     name: json["name"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }


// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

List<Blog> blogFromJson(String str) => List<Blog>.from(json.decode(str).map((x) => Blog.fromJson(x)));

String blogToJson(List<Blog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blog {
  int id;
  String title;
  String details;
  String featuredImageUrl;
  int categoryId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Blog({
    required this.id,
    required this.title,
    required this.details,
    required this.featuredImageUrl,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
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
