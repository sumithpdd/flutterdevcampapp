// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const LoginTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: ((value) {
          if (validator != null) return validator!(value);
        }),
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
        ),
        obscureText: obscureText);
  }
}
