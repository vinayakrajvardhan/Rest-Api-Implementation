
import 'dart:convert';

UserPut userPutFromJson(String str) => UserPut.fromJson(json.decode(str));

String userPutToJson(UserPut data) => json.encode(data.toJson());

class UserPut {
    UserPut({
        required this.updatedAt,
    });

    final DateTime updatedAt;

    factory UserPut.fromJson(Map<String, dynamic> json) => UserPut(
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt.toIso8601String(),
    };
}
