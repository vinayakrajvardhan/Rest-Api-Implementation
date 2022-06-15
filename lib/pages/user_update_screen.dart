import 'package:flutter/material.dart';
import 'package:restapi_post_put_delete/services/user_put_service.dart';

class UserUpdateScreen extends StatefulWidget {
  const UserUpdateScreen({Key? key}) : super(key: key);

  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
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
        title: Text("User UPDATE REST API"),
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
                await UserPutService.userUpdateData(
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
