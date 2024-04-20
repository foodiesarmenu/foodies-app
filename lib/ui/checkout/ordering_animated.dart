import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/order_details/order_details.dart';
import 'package:lottie/lottie.dart';

import '../../domain/model/Cart.dart';

class OrderingAnimated extends StatelessWidget {
  static const routeName = 'OrderingAnimatedSC';

  const OrderingAnimated({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Cart?;

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
      nextScreen: OrderDetails(cart: args),
      splashIconSize: 400,
      duration: 5000,
    );
  }
}
