import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/domain/model/OrderEntity.dart';
import 'package:intl/intl.dart';

import '../../cart/cart_screen.dart';
import '../../common/button_in_profile.dart';
import 'cubit/orders_tab_view_model.dart';

class OrderItemWidget extends StatelessWidget {
  OrderItemWidget(
      {this.viewModel, super.key, required this.order, this.statusColor});

  final OrderEntity? order;
  final Color? statusColor;
  OrdersTabViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(order?.date ?? '');
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    String formattedDateString = dateFormat.format(dateTime);

    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: order?.restaurant!.image ?? "",
                height: 75,
                width: 75,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url,
                    downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value:
                            downloadProgress.progress)),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
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
                      Text(order?.restaurant?.name ?? '',
                          style:
                          Theme.of(context).textTheme.titleSmall),
                      Spacer(),
                      Text(order?.status ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: statusColor)),
                    ],
                  ),
                  Text(formattedDateString,
                      style: Theme.of(context).textTheme.bodySmall),
                  Text('${order?.noOfOrderItems} Items',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary)),
                  //SizedBox(height: 16,),
                  Text('${order?.orderTotalPrice} EGP',
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
                onPressed: () async {
                  await viewModel
                  ?.deleteCart();
                  viewModel?.reOrder(orderId: order
                  ?.
                  id
                  ??
                  '
                  '
                  );
                },
                backgroundColor: Theme.of(context).primaryColor,
                text: 'Reorder',
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
                text: 'Feedback',
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
  }
}
