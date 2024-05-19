import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/cart/cubit/cart_states.dart';
import 'package:foodies_app/ui/common/cart_item_list_widget.dart';
import 'package:foodies_app/ui/common/custom_bottom_navigation_bar.dart';

import '../../di/di.dart';
import '../checkout/checkout_screen.dart';
import '../common/payment_details_widget.dart';
import '../common/restaurant_info_widget.dart';
import 'cubit/cart_screen_view_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  static const String routeName = 'CartSc';

  final viewModel = getIt<CartScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartScreenViewModel, CartScreenStates>(
        builder: (context, state) {
          if (state is GetCartErrorState || state is DeleteCartSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Cart'),
              ),
              body: const Center(
                child: Text('Cart is empty.'),
              ),
            );
          } else if (state is GetCartSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Cart'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      RestaurantInfoWidget(cart: state.cart),
                      const SizedBox(
                        height: 4,
                      ),

                      //Cart Item List
                      CartItemListWidget(
                          cart: state.cart, viewModel: viewModel),

                      const SizedBox(
                        height: 16,
                      ),
                      PaymentDetailsWidget(cart: state.cart),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: CustomBottomNavBar(
                onPressed: () {
                  Navigator.pushNamed(context, CheckoutScreen.routeName,
                      arguments: state.cart);
                },
                title: 'Checkout',
                isCheckOut: true,
              ),
            );
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
