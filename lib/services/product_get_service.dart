import '../models/products_model.dart';
import 'dart:developer';
import "package:http/http.dart" as http;

class ProductService{
  static Future<List<Product>> getPost() async {
    String url = "https://fakestoreapi.com/products";
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return productFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}