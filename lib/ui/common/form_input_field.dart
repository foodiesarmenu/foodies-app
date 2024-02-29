import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class FormInputField extends StatelessWidget {
  String hint;
  TextEditingController controller;
  bool isSecured;
  TextInputType keyboardType;
  MyValidator validator;

  FormInputField(
      {required this.controller,
      this.isSecured = false,
      required this.hint,
      required this.validator,
      this.keyboardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
          border: InputBorder.none,
        ),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isSecured,
        validator: validator,
      ),
    );
  }
}
