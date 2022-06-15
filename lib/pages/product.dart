import 'package:flutter/material.dart';

import 'package:restapi_post_put_delete/services/product_get_service.dart';

import '../models/products_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title: Text(
          "Products",
          style: TextStyle(color: Colors.grey.shade900),
        ),
      ),
      body: FutureBuilder<List<Product>>(
          future: ProductService.getPost(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  int? rate = snapshot.data?[index].rating.count;
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          snapshot.data?[index].image ?? "",
                          fit: BoxFit.cover,
                          height: 80,
                          width: 100,
                          errorBuilder: (context, _, child) {
                            return CircularProgressIndicator(
                              color: Colors.purple,
                            );
                          },
                        ),
                      ),
                      title: Text(snapshot.data?[index].title ?? ""),
                      subtitle: Text(
                        snapshot.data?[index].description ?? "",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                      ),
                      trailing: Text(
                        "\RS ${rate}",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                });
          })),
    );
  }
}
