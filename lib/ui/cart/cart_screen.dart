import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/cart/cart_item_widget.dart';
import 'package:foodies_app/ui/cart/cubit/cart_states.dart';
import 'package:foodies_app/ui/cart/payment_details_widget.dart';
import 'package:foodies_app/ui/cart/restaurant_info_widget.dart';
import 'package:foodies_app/ui/common/custom_bottom_navigation_bar.dart';

import '../../di/di.dart';
import '../checkout/checkout_screen.dart';
import 'cubit/cart_screen_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = 'CartSc';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final viewModel = getIt<CartScreenViewModel>();

  @override
  void initState() {
    viewModel.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RestaurantInfoWidget(cart: state.cart),
                      const Divider(),
                      Row(
                        children: [
                          Text('Order Details',
                              style: Theme.of(context).textTheme.titleMedium),
                          const Spacer(),
                          //Clear Cart
                          InkWell(
                            onTap: () {
                              viewModel.clearCart();
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.grey,
                                ),
                                Text('Clear Cart',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //Cart Items
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.cart.cartItems?.length ?? 0,
                        itemBuilder: (context, index) =>
                            CartItemWidget(cart: state.cart.cartItems?[index]),
                        separatorBuilder: (context, index) => Divider(
                          height: 10,
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                      const Divider(),
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
