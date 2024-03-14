import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  static const String routeName = 'MealDetailsSc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
