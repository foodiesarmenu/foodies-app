import 'package:flutter/material.dart';
import 'package:foodies_app/ui/cart/payment_details_widget.dart';

import '../../domain/model/Cart.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({this.cart, super.key});

  final Cart? cart;
  static const String routeName = '/orderDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: [PaymentDetailsWidget(cart: cart)],
            ),
          ),
        ));
  }
}
