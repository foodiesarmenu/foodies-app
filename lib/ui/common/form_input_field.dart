import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class FormInputField extends StatelessWidget {
  String? hint;
  String? label;
  TextEditingController controller;
  bool isSecured;
  TextInputType keyboardType;
  MyValidator validator;


  FormInputField(
      {required this.controller,
        this.isSecured = false,
        this.hint,
        this.label,
        required this.validator,
        this.keyboardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.black
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
