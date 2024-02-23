import 'package:flutter/material.dart';

typedef OnPressed = void Function();

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final OnPressed onPressed;

  const CustomButtonWidget(
      {required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
