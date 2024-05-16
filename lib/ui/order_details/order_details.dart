import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/common/custom_bottom_navigation_bar.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/order_details/cubit/orders_details_states.dart';
import '../../di/di.dart';
import '../common/cart_item_list_widget.dart';
import '../common/address_details_widget.dart';
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
    viewModel..getOrder(orderId: widget.orderId ?? '');
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
              title: const Text('Order Details'),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    RestaurantInfoWidget(
                      cart: state.orderResponse,
                      isCart: false,
                      isOrderDetails: true,
                      isOrder: true,
                    ),
                    AddressDetailsWidget(address: state.orderResponse?.deliveryAddress),
                    CartItemListWidget(
                        cart: state.orderResponse, isCart: false),
                    PaymentDetailsWidget(cart: state.orderResponse),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(
              title: 'Go Home',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName),
            ),
          );
        }
        return const Scaffold();
      },
    );
  }
}
