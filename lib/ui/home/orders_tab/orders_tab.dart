import 'package:flutter/material.dart';

import '../../common/ButtonInProfile.dart';
import 'order_list.dart';

class OrdersTab extends StatelessWidget {
  static const String routeName = 'OrdersSc';

  OrdersTab({super.key});

  final List<Order> orders = [
    Order(
      id: 'ss',
      restaurantName: 'Restaurant Name',
      price: 'EGP 100',
      orderStatus: 'Delivered',
      orderDate: 'April 15, 2024',
      imageUrl: 'assets/images/7oda.png',
    ),
    Order(
      id: 'ss',
      restaurantName: 'Restaurant Name',
      price: 'EGP 250',
      orderStatus: 'Pending',
      orderDate: 'April 17, 2024',
      imageUrl: 'assets/images/7oda.png',
    ),
    Order(
      id: 'ss',
      restaurantName: 'Restaurant Name',
      price: 'EGP 700',
      orderStatus: 'Canceled',
      orderDate: 'April 19, 2024',
      imageUrl: 'assets/images/7oda.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 30,
              endIndent: 30,
            );
          },
          itemCount: orders.length, // Length of the orders list
          itemBuilder: (context, index) {
            final order = orders[index]; // Get the current order
            Color statusColor;
            switch (order.orderStatus.toLowerCase()) {
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
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              order.imageUrl), // Use image URL from the order
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(order.restaurantName,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Spacer(),
                              Text(order.orderStatus,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: statusColor)),
                            ],
                          ),
                          Text(order.orderDate,
                              style: Theme.of(context).textTheme.bodySmall),
                          //SizedBox(height: 16,),
                          Text(order.price,
                              style: Theme.of(context).textTheme.titleSmall)
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ButtonInProfile(
                        onPressed: () {},
                        backgroundColor: Theme.of(context).primaryColor,
                        text: 'reorder',
                        textColor: Colors.white,
                        width: 150,
                        icon: Icons.refresh_outlined,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: ButtonInProfile(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        text: 'feedback',
                        textColor: Theme.of(context).primaryColor,
                        width: 150,
                        borderColor: Theme.of(context).primaryColor,
                        icon: Icons.feedback_outlined,
                        height: 40,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
          //
        ),
      ),
    );
  }
}
