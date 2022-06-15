
import 'dart:convert';

UserPatch userPatchFromJson(String str) => UserPatch.fromJson(json.decode(str));

String userPatchToJson(UserPatch data) => json.encode(data.toJson());

class UserPatch {
    UserPatch({
        required this.updatedAt,
    });

    final DateTime updatedAt;

    factory UserPatch.fromJson(Map<String, dynamic> json) => UserPatch(
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt.toIso8601String(),
    };
}
