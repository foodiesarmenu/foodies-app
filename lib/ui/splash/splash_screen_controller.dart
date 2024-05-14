import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';
import 'package:lottie/lottie.dart';

import '../auth/login/login_screen.dart';
import '../utils/shared_preference_utils.dart';

class SplashScreenController extends StatelessWidget {
  static const routeName = '/splashScreenController';

  const SplashScreenController({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    var user = SharedPreferenceUtils.getData(key: 'token');
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/Lottie/splash_animation.json',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      nextScreen: user != null ? const WelcomeScreen() : const LoginScreen(),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).primaryColor,
      duration: 3000,
    );
  }
}
