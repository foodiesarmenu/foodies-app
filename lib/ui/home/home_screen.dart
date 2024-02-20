import 'package:flutter/material.dart';

import '../custom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeSc';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(bottomNavigationBar: CustomNavigationBar());
  }
}
