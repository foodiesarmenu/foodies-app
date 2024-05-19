import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class EditTextInProfile extends StatelessWidget {
  String? hint;
  String? label;
  TextEditingController? controller;
  bool isSecured;
  TextInputType? keyboardType;
  MyValidator? validator;
  bool isTextFieldEnabled;
  final double? width; // New width parameter

  EditTextInProfile({
    required this.controller,
    this.isSecured = false,
    this.hint,
    this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isTextFieldEnabled = true,
    this.width, // Initialize the new width parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: width, // Use the width parameter here
      child: TextFormField(
        enabled: isTextFieldEnabled,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 18
          ),
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // Add rounded border with black color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust radius as desired
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0, // Adjust border width as desired
            ),
          ),
        ),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isSecured,
        validator: validator,
      ),
    );

  }
}
