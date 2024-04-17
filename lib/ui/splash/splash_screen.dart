import 'package:flutter/material.dart';

import 'animated_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "SplashSC";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacementNamed(AnimatedScreen.routeName);
    });
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
