import 'package:flutter/material.dart';

class DefaultLoginInput extends StatefulWidget {
  const DefaultLoginInput({super.key, required this.error, required this.setValue});
  final String? error;
  final Function setValue;
  @override
  State<DefaultLoginInput> createState() => _DefaultLoginInputState();
}

class _DefaultLoginInputState extends State<DefaultLoginInput> {
  String? errorText;
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
        errorText = 'Неправильный формат логина';
        break;
      default:
        errorText = null;
        break;
    }
    return TextFormField(
      onChanged: (value) {
        widget.setValue(value);
      },
      decoration: InputDecoration(
        labelText: 'Логин',
        errorText: errorText,
        filled: widget.error != null,
        fillColor: Colors.redAccent.withOpacity(0.3),
      ),
    );
  }
}