import 'package:api/CustomWidget/textfiled.dart';
import 'package:api/Models/user.dart';
import 'package:api/Services/remote_service.dart';
import 'package:api/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  // final _IdController = TextEditingController();

  postdata() async {
    // Map map = {};

    // map['FirstName'] = _firstNameController.text;
    // map['Lastname'] = _lastNameController.text;
    // map['Age'] = _ageController.text;
    var user = User(
      firstname: _firstNameController.text,
      lastname: _lastNameController.text,
      age: int.parse(_ageController.text),
      // id: _IdController.text,
    );

    await Remoteservice().post('/users', user).then(
          (value) => Navigator.of(context).pop(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.person_add,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text('Add User details!'),
          const SizedBox(height: 15),
          MyTextField(
            controller: _firstNameController,
            hintText: 'First Name',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          MyTextField(
            controller: _lastNameController,
            hintText: 'Last Name',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          MyTextField(
            controller: _ageController,
            hintText: 'Age',
            obscureText: false,
          ),
          // MyTextField(
          //   controller: _IdController,
          //   hintText: 'Id',
          //   obscureText: false,
          // ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: postdata,
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
