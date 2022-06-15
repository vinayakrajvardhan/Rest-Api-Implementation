import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/product_put_model.dart';

class ProductPutService {
  static Future<ProductPut> productUpdateData({
    String? title,
    double? price,
    String? description,
    int? idUpdate,
  }) async {
    final String url = "https://fakestoreapi.com/products/${idUpdate}";
    http.Response response = await http.put(Uri.parse(url), body: {
      "title": title,
      "price": price.toString(),
      "description": description,
    });
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return productPutFromJson(response.body);
    } else {}
    return ProductPut(id: 1);
  }
}
