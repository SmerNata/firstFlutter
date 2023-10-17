import 'package:flutter/material.dart';

class DefaultPasswordInput extends StatefulWidget {
  const DefaultPasswordInput({super.key, required this.error, required this.setValue});
  final String? error;
  final Function setValue;
  @override
  State<DefaultPasswordInput> createState() => _DefaultPasswordInputState();
}

class _DefaultPasswordInputState extends State<DefaultPasswordInput> {
  String? errorText;
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    switch (widget.error) {
      case 'NULL_VALUE':
        errorText = 'Обязательное для заполнения';
        break;
      case 'FORMAT_ERROR':
        errorText = 'Неправильный формат пароля';
        break;
      default:
        errorText = null;
        break;
    }
    return TextFormField(
      onChanged: (value)  {
        widget.setValue(value);
      },
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        labelText: 'Пароль',
        errorText: errorText,
        filled: widget.error != null,
        fillColor: Colors.redAccent.withOpacity(0.3),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
      ),
    );
  }
}