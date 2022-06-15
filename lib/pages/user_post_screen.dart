import 'package:flutter/material.dart';
import '../services/user_post_service.dart';

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({Key? key}) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
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
        title: Text("User Create POST REST API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _firstName,
              decoration: InputDecoration(labelText: "first name"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _lastName,
              decoration: InputDecoration(labelText: "last name"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () async {
                await UserPostService.userCreateData(
                  email: _emailController.text,
                  first_name: _firstName.text,
                  last_name: _lastName.text,
                );

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(actions: [
                    Text("Name is :${_emailController.text}"),
                    Text("First Name is :${_firstName.text}"),
                    Text("Last Name is :${_lastName.text}"),
                  ]),
                );
              },
              child: Text(
                "Create User",
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
