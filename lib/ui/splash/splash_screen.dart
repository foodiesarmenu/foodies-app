import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../signing/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/Lottie/Animation - 1710501389105.json',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
              animate: true,
            ),
          )
        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).primaryColor,
      duration: 5500,
    );
  }
}
