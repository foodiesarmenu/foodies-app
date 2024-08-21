import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/ui/common/custom_bottom_navigation_bar.dart';
import 'package:foodies_app/ui/main_navigation/main_navigation_screen.dart';
import 'package:foodies_app/ui/order_details/cubit/orders_details_states.dart';

import '../../di/di.dart';
import '../common/address_details_widget.dart';
import '../common/cart_item_list_widget.dart';
import '../common/payment_details_widget.dart';
import '../common/restaurant_info_widget.dart';
import 'cubit/orders_details_view_model.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({this.orderId, super.key});

  static const String routeName = '/orderDetails';
  final String? orderId;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var viewModel = getIt<OrderDetailsViewModel>();
  Color? statusColor;

  @override
  void initState() {
    super.initState();
    viewModel.getOrder(orderId: widget.orderId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsViewModel, OrderDetailsStates>(
      bloc: viewModel,
      builder: (context, state) {

        if (state is GetOrderLoadingState) {
          return Scaffold(body: const Center(child: CircularProgressIndicator()));
        } else if (state is GetOrderErrorState) {
          return Scaffold(
              body: Center(
                  child: Text(state.errorMessage.errorMessage ?? 'Error')));
        } else if (state is GetOrderSuccessState) {

          return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('Order Details',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w400))),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
                  child: Column(
                    children: [
                      RestaurantInfoWidget(
                        cart: state.orderResponse,
                        isCart: false,
                        isOrderDetails: true,
                        isOrder: true,
                      ),
                      AddressDetailsWidget(
                        address: state.orderResponse?.deliveryAddress,
                        user: viewModel.user,
                      ),
                      CartItemListWidget(
                          cart: state.orderResponse, isCart: false),
                      PaymentDetailsWidget(cart: state.orderResponse),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(
              title: 'Go Home',
              onPressed: () => Navigator.pushReplacementNamed(
                  context, MainNavigationScreen.routeName),
            ),
          );
        }
        return const Scaffold();
      },
    );
  }
}
