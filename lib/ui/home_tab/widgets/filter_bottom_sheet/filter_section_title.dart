import 'package:flutter/material.dart';

class FilterTitle extends StatelessWidget {
  const FilterTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
