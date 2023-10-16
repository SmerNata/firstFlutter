import 'package:flutter/material.dart';
import 'package:test_app/models/new_user.dart';

import '../models/dio.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;
  NewUser? retrievedUser;
  final DioRequest _dioRequest = DioRequest();

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

                    retrievedUser = await _dioRequest.createUser(newUser: newUser);
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
        if (retrievedUser != null) 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('ID: ${retrievedUser!.id}'),
                Text('Name: ${retrievedUser!.name}'),
                Text('Job: ${retrievedUser!.job}'),
                Text(
                  'Created at: ${retrievedUser!.createdAt}',
                ),
              ],
            ),
          ),
      ],
    );
  }
}