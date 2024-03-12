import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class FormInputField extends StatelessWidget {
  //String? hint;
  String? label;
  TextEditingController controller;
  bool isSecured;
  TextInputType keyboardType;
  MyValidator validator;

//new
  IconData? icon;
  String hint;
  bool isPassword;
  bool isEmail;

  FormInputField(
      {required this.controller,
      this.isSecured = false,
      this.label,
      required this.validator,
      this.keyboardType = TextInputType.text,
//new
      required this.hint,
      this.icon,
      required this.isPassword,
      required this.isEmail,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        //new
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,

        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: const Color(0xFFB6C7D1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA7BCC7)),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA7BCC7)),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0XFFA7BCC7)),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
          /*hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),*/
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
        ),
        controller: controller,

        //keyboardType: keyboardType,
        //obscureText: isSecured,
        validator: validator,
      ),
    );
  }
}
