  import 'package:animated_splash_screen/animated_splash_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:foodies_app/ui/order_details/order_details.dart';
  import 'package:lottie/lottie.dart';

  class OrderingSplashScreen extends StatelessWidget {
    static const routeName = 'OrderingAnimatedSC';

    const OrderingSplashScreen({this.orderId,super.key});
    final String? orderId;
    get splash => null;

    @override
    Widget build(BuildContext context) {
      return AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: LottieBuilder.asset(
                'assets/Lottie/ordering_animation.json',
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
        nextScreen: OrderDetails(orderId: orderId ?? ''),
        splashIconSize: 400,
        duration: 5000,
      );
    }
  }
