import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/model/OrderEntity.dart';
import '../menu/menu_screen.dart';

class RestaurantInfoWidget extends StatelessWidget {
   RestaurantInfoWidget(
      {Key? key,
      this.isCart = true,
      this.isOrderDetails = true,
      this.isOrder = false,
      required this.cart,
      this.navigateToChangeAddress,
      this.refreshMenuState})
      : super(key: key);

  final OrderEntity? cart;
  final bool isCart;
  final bool isOrderDetails;
  final bool isOrder;
  final Function? navigateToChangeAddress;
  late final Color? statusColor;
  final Function()? refreshMenuState;

  @override
  Widget build(BuildContext context) {
    switch (cart?.status?.toLowerCase()) {
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
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: cart?.restaurant?.image ?? "",
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your order from',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text(cart?.restaurant?.name ?? "",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const Expanded(
                  // Replaced Spacer with Expanded
                  child: SizedBox(),
                ),
                if (isCart)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(
                              restaurantId: cart?.restaurant?.id ?? '',
                              refreshHomeState: refreshMenuState),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        const Text('Add Items'),
                      ],
                    ),
                  ),
                if(isOrder)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(cart?.status ?? "",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                            ),
                  ),
                  ),
              ],
            ),
            if (!isCart && !isOrderDetails)
              const SizedBox(
                height: 16,
              ),
            if (!isCart && !isOrderDetails)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery address',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  InkWell(
                    onTap: () {
                      navigateToChangeAddress!();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Select',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
