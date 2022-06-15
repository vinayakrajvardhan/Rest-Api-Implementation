import 'dart:developer';

import '../models/user_post_model.dart';
import 'package:http/http.dart' as http;

class UserPostService {
  static Future<UserPost> userCreateData({
    String? email,
    String? first_name,
    String? last_name,
  }) async {
    final String url = "https://reqres.in/api/users";
    http.Response response = await http.post(Uri.parse(url), body: {
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
    });
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return userPostFromJson(response.body);
    } else {}
    return UserPost(id: "1", createdAt: DateTime.now());
  }
}
