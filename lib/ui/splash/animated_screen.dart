import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class AnimatedScreen extends StatelessWidget {
  static const routeName = 'AnimatedSC';

  const AnimatedScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/Lottie/splash.json',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      nextScreen: const WelcomeScreen(),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).primaryColor,
      duration: 3000,
    );
  }
}
