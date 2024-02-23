import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  String text;

  CustomTextFieldWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: text,
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            filled: true,
            fillColor: const Color(0xFFF6F4F5),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
