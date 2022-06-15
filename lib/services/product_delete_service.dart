import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/product_delete_model.dart';


class ProductDeleteService {
  static Future<ProductDelete> productDeleteData({
    String? title,
    double? price,
    String? description,
    int? idUpdate,
  }) async {
    final String url = "https://fakestoreapi.com/products/${idUpdate}";
    http.Response response = await http.delete(Uri.parse(url), body: {
      "title": title,
      "price": price.toString(),
      "description": description,
    });
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return productDeleteFromJson(response.body);
    } else {}
    return ProductDelete(
        id: idUpdate ?? 0,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.95,
        description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        category: "men's clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: Rating(
          count: 4,
          rate: 44.5,
        ));
  }
}
