import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/inputs/default_email_input.dart';
import '../components/inputs/default_password_input.dart';
import '../viewmodel/login_view_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginViewState loginViewState = LoginViewState();
  bool showValues = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Вход',
                style: TextStyle(
                  fontWeight: FontWeight.w500, 
                  fontSize: 20
                ),
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) => DefaultLoginInput(
                  error: loginViewState.error.login, 
                  setValue: loginViewState.setLogin
                ),
              ),
              SizedBox(height: 5),
              Observer(
                builder: (_) => DefaultPasswordInput(
                  error: loginViewState.error.password, 
                  setValue: loginViewState.setPassword
                ),
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        MaterialColor color = Colors.green;
                        if (states.contains(MaterialState.disabled)) {
                          color = Colors.grey;
                        }
                        return color;
                      },
                    ),
                  ),
                  onPressed: loginViewState.isSubmit ? () {
                    print(loginViewState.login);
                    print(loginViewState.password);
                    setState(() {
                      showValues = true;
                    });
                  } : null,
                  child: Text(
                    'Отправить',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (showValues) Text(
                'Логин:${loginViewState.login}, Пароль:${loginViewState.password}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      )
    );
  }
}