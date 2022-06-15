import 'package:flutter/material.dart';

import 'package:restapi_post_put_delete/services/post_service.dart';

class PostDataScreen extends StatefulWidget {
  const PostDataScreen({Key? key}) : super(key: key);

  @override
  State<PostDataScreen> createState() => _PostDataScreenState();
}

class _PostDataScreenState extends State<PostDataScreen> {
  late final _titleController;
  late final _bodyController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                hintText: 'body',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                PostService.getPost();
              },
              child: const Text("GET DATA"),
            ),
            ElevatedButton(
              onPressed: () {
                PostService.createPost(
                  title: _titleController.text,
                  body: _bodyController.text,
                );
              },
              child: const Text("POST DATA"),
            ),
            ElevatedButton(
              onPressed: () {
                PostService.updatePost(
                  num: 4.toString(),
                  title: _titleController.text,
                  body: _bodyController.text,
                );
              },
              child: const Text("PUT data"),
            ),
            ElevatedButton(
              onPressed: () {
                PostService.deletePost(
                  title: _titleController.text,
                  body: _bodyController.text,
                );
              },
              child: const Text("DELETE data"),
            )
          ],
        ),
      ),
    );
  }
}
