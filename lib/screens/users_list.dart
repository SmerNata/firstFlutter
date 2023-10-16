import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewmodel/users_view_model.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  UserListPageState createState() => UserListPageState();
}

class UserListPageState extends State<UserListPage> {
  final UsersViewModel usersState = UsersViewModel();
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Список пользователей',
          style: TextStyle(
            fontWeight: FontWeight.w500, 
            fontSize: 20
          ),
        ),
        SizedBox(height: 10),
        Observer(
          builder: (_) {
            switch (usersState.status) {
              case (1):
                return Column(
                mainAxisSize: MainAxisSize.min,
                children: [ 
                  for (var userInfo in usersState.userList) Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(userInfo!.avatar),
                      SizedBox(height: 8.0),
                      Text(
                        '${userInfo.firstName} ${userInfo.lastName}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        userInfo.email,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              );
              case (0):
                return CircularProgressIndicator();
              default:
                return ElevatedButton(
                onPressed: () {
                  usersState.getUsers();
                },
                child: Text('Загрузить данные')
              );
            }
          }
        ),
      ],
    )
    );
  }
}