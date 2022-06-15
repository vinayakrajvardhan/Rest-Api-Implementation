
import 'dart:convert';

UserPost userPostFromJson(String str) => UserPost.fromJson(json.decode(str));

String userPostToJson(UserPost data) => json.encode(data.toJson());

class UserPost {
    UserPost({
        required this.id,
        required this.createdAt,
    });

    final String id;
    final DateTime createdAt;

    factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
    };
}
