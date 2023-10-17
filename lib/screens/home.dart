import 'package:flutter/material.dart';

import 'login.dart';
import 'users_list.dart';
import 'new_user.dart';
import 'user.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LoginPage();
        break;
      case 1:
        page = UserListPage();
        break;
      case 2:
        page = UserPage();
        break;
      case 3:
        page = CreateUser();
        break;
      default:
        throw UnimplementedError('нет виджета для $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.login),
                      label: Text('Вход'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.list),
                      label: Text('Список пользователей'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.account_circle),
                      label: Text('Пользователь'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.add),
                      label: Text('Добавить пользователя'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Center(
                    child: SingleChildScrollView(
                      child: page,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}