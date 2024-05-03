import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/home/orders_tab/cubit/orders_tab_states.dart';
import 'package:foodies_app/ui/home/orders_tab/cubit/orders_tab_view_model.dart';

import '../../../di/di.dart';
import '../../common/ButtonInProfile.dart';
import '../../order_details/order_details.dart';
import 'order_item_widget.dart';

class OrdersTab extends StatelessWidget {
  static const String routeName = 'OrdersSc';

  OrdersTab({super.key});

  final viewModel = getIt<OrdersTabViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersTabViewModel,OrdersTabStates>(
      bloc: viewModel..getAllOrders(),
      builder: (context, state) {
        return Scaffold(
          body: (state is GetAllOrdersSuccessState) ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 30,
                  endIndent: 30,
                );
              },
              itemCount: state.ordersResponse.length, // Length of the orders list
              itemBuilder: (context, index) {
                Color statusColor;
                switch (state.ordersResponse[index].status?.toLowerCase()) {
                  case 'delivered':
                    statusColor = Colors.green;
                    break;
                  case 'pending':
                    statusColor = Theme.of(context).primaryColor;
                    break;
                  case 'canceled':
                    statusColor = Colors.red;
                    break;
                  default:
                    statusColor = Colors.black;
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetails(orderId: state.ordersResponse[index].id ?? ''),
                      ),
                    );
                  },
                  child: OrderItemWidget(
                    order: state.ordersResponse[index],
                    statusColor: statusColor,
                  ),
                );
              },
              //
            ),
          ) :
          const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
