import 'dart:developer';
import 'package:restapi_post_put_delete/models/user_patch_model.dart';
import 'package:http/http.dart' as http;

class UserPatchService {
  static Future<UserPatch> userPatchData({
    String? email,
    String? first_name,
  }) async {
    final String url = "https://reqres.in/api/users/2";
    http.Response response = await http.patch(Uri.parse(url), body: {
      "email": email,
      "first_name": first_name,
    });
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return userPatchFromJson(response.body);
    } else {}
    return UserPatch(updatedAt: DateTime.now());
  }
}
