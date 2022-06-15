import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/user_update_model.dart';

class UserPutService {
  static Future<UserPut> userUpdateData({
    String? email,
    String? first_name,
    String? last_name,
  }) async {
    final String url = "https://reqres.in/api/users/2";
    http.Response response = await http.put(Uri.parse(url), body: {
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
    });
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return userPutFromJson(response.body);
    } else {}
    return UserPut(
      updatedAt: DateTime.now(),
    );
  }
}
