import 'package:flutter/material.dart';
import 'package:test_app/models/dio.dart';

import '../models/user.dart';

class UserListPage extends StatefulWidget {
  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final DioRequest _dioRequest = DioRequest();
  bool isGetUserList = false;
  late List<User?> userList;
  void getNext() async {
    userList = await _dioRequest.getUserList();
    setState(() {
      isGetUserList = true;
    });
  }
  @override
  void initState() {
    super.initState();
    getNext();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isGetUserList ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var userInfo in userList) Column(
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
        )
        : CircularProgressIndicator(),
      ],
    );
  }
}