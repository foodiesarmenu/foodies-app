import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = 'OrdersSc';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
