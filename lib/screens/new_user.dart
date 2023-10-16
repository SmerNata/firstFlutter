import 'package:flutter/material.dart';
import 'package:test_app/models/new_user.dart';

import '../services/user_service.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;
  final UserService _userService = UserService();
  NewUserResponse? userResponse;
  NewUser? user;

  bool isCreating = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _jobController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(hintText: 'Имя'),
        ),
        TextField(
          controller: _jobController,
          decoration: InputDecoration(hintText: 'Работа'),
        ),
        SizedBox(height: 16.0),
        isCreating
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isCreating = true;
                  });

                  if (_nameController.text != '' &&
                      _jobController.text != '') {
                    NewUser newUser = NewUser(
                      name: _nameController.text,
                      job: _jobController.text,
                    );

                    var result = await _userService.createUser(newUser: newUser);
                    if (result.status) {
                      userResponse = result.data;
                      user = userResponse?.data;
                    } else {
                      user = null;
                    }
                  }

                  setState(() {
                    isCreating = false;
                  });
                },
                child: Text(
                  'Создать',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
        if (user != null) 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('ID: ${user!.id}'),
                Text('Name: ${user!.name}'),
                Text('Job: ${user!.job}'),
                Text(
                  'Created at: ${user!.createdAt}',
                ),
              ],
            ),
          ),
      ],
    );
  }
}