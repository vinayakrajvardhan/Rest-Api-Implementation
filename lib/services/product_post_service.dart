import 'dart:developer';
import '../models/product_post_model.dart';
import 'package:http/http.dart' as http;

class ProductPostService {
  static Future<ProductPost> productCreateData({
    String? title,
    double? price,
    String? description,
  }) async {
    final String url = "https://fakestoreapi.com/products";
    http.Response response = await http.post(Uri.parse(url), body: {
      "title": title,
      "price": price.toString(),
      "description": description,
    });
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return productPostFromJson(response.body);
    } else {}
    return ProductPost(id: 1);
  }
}
