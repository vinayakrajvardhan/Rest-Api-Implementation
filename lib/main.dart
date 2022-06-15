import 'package:flutter/material.dart';
import 'package:restapi_post_put_delete/pages/product.dart';
import 'package:restapi_post_put_delete/pages/user_patch_screen.dart';

import 'pages/post.dart';
import 'pages/product_delete_screen.dart';
import 'pages/product_post_screen.dart';
import 'pages/user_post_screen.dart';
import 'pages/user_update_screen.dart';
import 'services/product_put_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDeleteScreen(),
    );
  }
}
