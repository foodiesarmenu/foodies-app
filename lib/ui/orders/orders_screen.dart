import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/main_bottom_nav_bar.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = 'OrdersSc';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      ),
      bottomNavigationBar: MainBottomNavBar(),
    );
  }
}
