import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class FormInputField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final bool isSecured;
  final TextInputType keyboardType;
  final MyValidator? validator;
  final IconData? icon;
  final String? hint;
  final bool isPassword;
  final bool isEmail;
  final FloatingLabelBehavior floatingLabelBehavior;

  FormInputField(
      {required this.controller,
      this.isSecured = false,
      this.label,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.hint,
      this.icon,
      this.isPassword = false,
      this.isEmail = false,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isSecured,
        //new
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: const Color(0xFFB6C7D1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          //labelStyle: const TextStyle(fontSize: 16, color: Color(0XFFA7BCC7)),
          floatingLabelBehavior: floatingLabelBehavior,
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
