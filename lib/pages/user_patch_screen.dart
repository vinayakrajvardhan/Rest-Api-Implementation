import 'package:flutter/material.dart';
import 'package:restapi_post_put_delete/services/user_patch_service.dart';

class UserPatchScreen extends StatefulWidget {
  const UserPatchScreen({Key? key}) : super(key: key);

  @override
  State<UserPatchScreen> createState() => _UserPatchScreenState();
}

class _UserPatchScreenState extends State<UserPatchScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;

  @override
  void initState() {
    _emailController = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("User PATCH REST API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "name"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _firstName,
              decoration: InputDecoration(labelText: "job"),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () async {
                await UserPatchService.userPatchData(
                  email: _emailController.text,
                  first_name: _firstName.text,
                );

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(actions: [
                    Text("Name is :${_emailController.text}"),
                    Text("First Name is :${_firstName.text}"),
                  ]),
                );
              },
              child: Text(
                "Update User",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
