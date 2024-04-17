import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  static const String routeName = 'OrdersSc';

  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
