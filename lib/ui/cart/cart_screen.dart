import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/cart/cubit/cart_states.dart';
import 'package:foodies_app/ui/common/cart_item_list_widget.dart';
import 'package:foodies_app/ui/common/custom_bottom_navigation_bar.dart';

import '../../di/di.dart';
import '../../domain/model/OrderEntity.dart';
import '../checkout/checkout_screen.dart';
import '../common/payment_details_widget.dart';
import '../common/restaurant_info_widget.dart';
import 'cubit/cart_screen_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({this.isScanner = false, this.refreshMenuState, Key? key})
      : super(key: key);
  final Function()? refreshMenuState;
  final bool? isScanner;
  static const String routeName = 'CartSc';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final viewModel = getIt<CartScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.couponController.addListener(_onCouponTextChanged);
    viewModel.errorStream.listen((errorMessage) {
      if (errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error, color: Colors.white),
                SizedBox(width: 8),
                Expanded(child: Text(errorMessage)),
              ],
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    viewModel.couponController.removeListener(_onCouponTextChanged);
    viewModel.couponController.dispose();
    super.dispose();
  }

  void _onCouponTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartScreenViewModel, CartScreenStates>(
        builder: (context, state) {
          if (state is DeleteCartSuccessState) {
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
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (widget.refreshMenuState != null) {
                      widget.refreshMenuState!();
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      RestaurantInfoWidget(
                          cart: state.cart,
                          refreshMenuState: widget.refreshMenuState),
                      const SizedBox(
                        height: 4,
                      ),

                      //Cart Item List
                      CartItemListWidget(
                          cart: state.cart,
                          viewModel: viewModel,
                          refreshMenuState: widget.refreshMenuState),
                      const SizedBox(
                        height: 4,
                      ),

                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: .5),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enabled: (viewModel.couponApplied == false)
                                        ? true
                                        : false,
                                    controller: viewModel.couponController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.local_offer,
                                          color:
                                              Theme.of(context).primaryColor),
                                      hintText: 'Enter Promocode',
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                (viewModel.couponController.text.isNotEmpty)
                                    ? InkWell(
                                        onTap: () {
                                          viewModel.applyCoupon();
                                        },
                                        child: Text('Submit',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14)),
                                      )
                                    : Text('Submit',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))
                              ],
                            ),
                            if (viewModel.couponApplied == true)
                              Text(
                                'Promocode has been applied',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                          ],
                        ),
                      ),

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
                    arguments: CheckoutArguments(
                        cart: state.cart, isScanner: widget.isScanner),
                  );
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

class CheckoutArguments {
  final OrderEntity? cart;
  final bool? isScanner;

  CheckoutArguments({required this.cart, required this.isScanner});
}
