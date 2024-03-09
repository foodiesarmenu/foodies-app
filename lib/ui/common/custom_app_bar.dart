import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w400),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
