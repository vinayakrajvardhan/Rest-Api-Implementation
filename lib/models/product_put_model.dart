import 'dart:convert';

ProductPut productPutFromJson(String str) =>
    ProductPut.fromJson(json.decode(str));

String productPutToJson(ProductPut data) => json.encode(data.toJson());

class ProductPut {
  ProductPut({
    required this.id,
  });

  final int id;

  factory ProductPut.fromJson(Map<String, dynamic> json) => ProductPut(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
