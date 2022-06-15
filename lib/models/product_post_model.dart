
import 'dart:convert';

ProductPost productPostFromJson(String str) => ProductPost.fromJson(json.decode(str));

String productPostToJson(ProductPost data) => json.encode(data.toJson());

class ProductPost {
    ProductPost({
        required this.id,
    });

    final int id;

    factory ProductPost.fromJson(Map<String, dynamic> json) => ProductPost(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
