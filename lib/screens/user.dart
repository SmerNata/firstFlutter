import 'package:flutter/material.dart';
import 'package:test_app/models/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/user.dart';
import '../viewmodel/user_view_model.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final TextEditingController _idController;
  final DioRequest _dioRequest = DioRequest();
  bool isGetUser = false;
  final _userViewModel = UserViewModel();
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
                    _userViewModel.getUser(_idController.text);
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
        Observer(
          builder: (_) { 
            return _userViewModel.isLoading ? 
            CircularProgressIndicator() : 
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(_userViewModel.user!.avatar),
                SizedBox(height: 8.0),
                Text(
                  '${_userViewModel.user!.firstName} ${_userViewModel.user!.lastName}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  _userViewModel.user!.email,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            );
          }
        ),
      ],
    );
  }
}