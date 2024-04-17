import 'package:flutter/material.dart';

import '../../domain/model/Cart.dart';
import '../common/custom_bottom_navigation_bar.dart';
import '../payment/payment_screen.dart';
import 'ordering_animated.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  String paymentMethod = 'Cash';
  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Cart?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: const Center(
        child: Text('Checkout Screen'),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        isCheckOut: true,
        title: 'Place order',
        onPressed: () {
          if (paymentMethod == 'Cash') {
            Navigator.pushNamed(context, OrderingAnimated.routeName);
          } else if (paymentMethod == 'Card') {
            Navigator.pushNamed(context, PaymentScreen.routeName);
          }
        },
      ),
    );
  }
}
