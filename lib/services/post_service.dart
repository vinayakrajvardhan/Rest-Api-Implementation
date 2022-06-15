import 'dart:developer';

import "package:http/http.dart" as http;
import 'package:restapi_post_put_delete/models/post_model.dart';

class PostService {
  //GET post
  static Future<PostModel> getPost() async {
    String url = "https://jsonplaceholder.typicode.com/posts/1";
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return PostModel(
      userId: 101,
      id: 9,
      title: "title",
      body: "error",
    );
  }

  //POST method
  static Future<PostModel> createPost({String? title, String? body}) async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "title": title,
        "body": body,
      });
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return PostModel(
      userId: 101,
      id: 9,
      title: "title",
      body: "error",
    );
  }

//PUT method
  static Future<PostModel> updatePost(
      {String? title, String? body, String? num}) async {
    String url =
        "https://jsonplaceholder.typicode.com/posts/${num}?title=${title}&body=${body}";
    try {
      final response = await http.put(Uri.parse(url), body: {
        "title": title,
        "body": body,
      });
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return PostModel(
      userId: 101,
      id: 9,
      title: "title",
      body: "error",
    );
  }

  //DELETE method
  static Future<PostModel> deletePost({String? title, String? body}) async {
    String url =
        "https://jsonplaceholder.typicode.com/posts?title=${title}&body=${body}";
    try {
      final response = await http.delete(Uri.parse(url), body: {
        "title": title,
        "body": body,
      });
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return PostModel(
      userId: 101,
      id: 9,
      title: "title",
      body: "error",
    );
  }
}
