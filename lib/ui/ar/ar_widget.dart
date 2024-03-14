import 'package:flutter/material.dart';

class ArWidget extends StatelessWidget {
  const ArWidget({super.key});

  static const String routeName = 'ArSc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
