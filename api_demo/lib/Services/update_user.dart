import 'package:api/CustomWidget/textfiled.dart';
import 'package:api/Models/user.dart';
import 'package:api/Services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UpdateUser extends StatefulWidget {
  UpdateUser({
    super.key,
    required this.FirstName,
    required this.LastName,
    required this.Age,
    required this.Id,
  });

  // ignore: non_constant_identifier_names
  String FirstName;
  String LastName;
  int? Age;
  String Id;

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  // final _IdController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.FirstName;
    _lastNameController.text = widget.LastName;
    _ageController.text = widget.Age.toString();
  }

  putdata() async {
    var user = User(
      firstname: _firstNameController.text,
      lastname: _lastNameController.text,
      age: int.parse(_ageController.text),
      // id: _IdController.text,
    );

    await Remoteservice().put('/users/${widget.Id}', user);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.person,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text('Update User details!'),
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
            onPressed: putdata,
            child: const Text(
              'Update',
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
