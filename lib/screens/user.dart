import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final TextEditingController _idController;
  final UserService _userService = UserService();
  bool isGetUser = false;
  UserResponse? userResponse;
  User? user;
  String errorText = '';
  @override
  void initState() {
    _idController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _idController,
          decoration: InputDecoration(hintText: 'Id пользователя'),
        ),
        SizedBox(height: 16.0),
        isGetUser
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isGetUser = true;
                  });

                  if (_idController.text != '') {
                    var result = await _userService.getUser(_idController.text);
                    if (result.status) {
                      userResponse = result.data;
                      user = userResponse?.data;
                    } else {
                      user = null;
                      switch (result.genericError) {
                        case 'DATA_NOT_FOUND':
                            errorText = 'Пользователь не найден';
                          break;
                        default:
                            errorText = 'Произошла ошибка. Попробуйте позже.';
                      }
                    }
                  }

                  setState(() {
                    isGetUser = false;
                  });
                },
                child: Text(
                  'Найти',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
        SizedBox(height: 16.0),
        user != null ?
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(user!.avatar),
              SizedBox(height: 8.0),
              Text(
                '${user!.firstName} ${user!.lastName}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                user!.email,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          )
        : Text(
            errorText,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.0
              ),
          ),
      ],
    );
  }
}