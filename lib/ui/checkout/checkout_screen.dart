import 'package:flutter/material.dart';
import 'package:foodies_app/ui/cart/payment_details_widget.dart';
import 'package:foodies_app/ui/cart/restaurant_info_widget.dart';

import '../../domain/model/Cart.dart';
import '../common/custom_bottom_navigation_bar.dart';
import 'address_details_widget.dart';
import 'ordering_animated.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String paymentMethod = 'Click to choose payment method';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Cart?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              RestaurantInfoWidget(cart: args, isCart: false),
              const SizedBox(
                height: 4,
              ),

              const AddressDetailsWidget(),
              const SizedBox(
                height: 8,
              ),

              //Payment Method
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      'Pay with',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      paymentMethod,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text('Cash'),
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    paymentMethod = 'Cash';
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text('Card'),
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    paymentMethod = 'Card';
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              PaymentDetailsWidget(cart: args)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        isCheckOut: true,
        title: 'Place order',
        onPressed: () {
          if (paymentMethod == 'Cash') {
            Navigator.pushReplacementNamed(context, OrderingAnimated.routeName,
                arguments: args);
          } else if (paymentMethod == 'Card') {
            Navigator.pushReplacementNamed(context, OrderingAnimated.routeName,
                arguments: args);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Please choose payment method'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
