import 'package:flutter/material.dart';

import '../signing/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashSc";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/splash_image.png",
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
