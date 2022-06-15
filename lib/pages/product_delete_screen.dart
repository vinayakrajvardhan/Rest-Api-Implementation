import 'package:flutter/material.dart';
import 'package:restapi_post_put_delete/services/product_delete_service.dart';

class ProductDeleteScreen extends StatefulWidget {
  const ProductDeleteScreen({Key? key}) : super(key: key);

  @override
  State<ProductDeleteScreen> createState() => _ProductDeleteScreenState();
}

class _ProductDeleteScreenState extends State<ProductDeleteScreen> {
  late final TextEditingController _title;
  late final TextEditingController _price;
  late final TextEditingController _description;
  @override
  void initState() {
    _title = TextEditingController();
    _price = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Product Delete REST API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(labelText: "title"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _price,
              decoration: InputDecoration(labelText: "price"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _description,
              decoration: InputDecoration(labelText: "description"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () async {
                await ProductDeleteService.productDeleteData(
                  title: _title.text,
                  price: double.parse(_price.text),
                  description: _description.text,
                  idUpdate: 2,
                );

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(actions: [
                    Text("Title :${_title.text}"),
                    Text("Price is :${double.tryParse(_price.text)}"),
                    Text("Description is :${_description.text}"),
                  ]),
                );
              },
              child: Text(
                "delete Product",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            )
          ],
        ),
      ),
    );
  }
}
