import 'package:flutter/material.dart';
import '../services/product_post_service.dart';

class ProductPostScreen extends StatefulWidget {
  const ProductPostScreen({Key? key}) : super(key: key);

  @override
  State<ProductPostScreen> createState() => _ProductPostScreenState();
}

class _ProductPostScreenState extends State<ProductPostScreen> {
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
        title: Text("Product Create POST REST API"),
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
                await ProductPostService.productCreateData(
                    title: _title.text,
                    price: double.parse(_price.text),
                    description: _description.text);

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
                "Create Product",
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
