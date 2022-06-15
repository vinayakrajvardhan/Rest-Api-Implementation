import 'dart:convert';

List<ListPostModel> listPostModelFromJson(String str) =>
    List<ListPostModel>.from(
        json.decode(str).map((x) => ListPostModel.fromJson(x)));

String listPostModelToJson(List<ListPostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListPostModel {
  ListPostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory ListPostModel.fromJson(Map<String, dynamic> json) => ListPostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
