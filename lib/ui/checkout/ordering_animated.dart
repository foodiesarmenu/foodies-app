import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home/home_screen.dart';

class OrderingAnimated extends StatelessWidget {
  static const routeName = 'OrderingAnimatedSC';

  const OrderingAnimated({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/Lottie/ordering.json',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      nextScreen: const HomeScreen(),
      splashIconSize: 400,
      duration: 5000,
    );
  }
}
