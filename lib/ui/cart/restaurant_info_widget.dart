import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/domain/model/Cart.dart';

import '../menu/menu_screen.dart';

class RestaurantInfoWidget extends StatelessWidget {
  const RestaurantInfoWidget({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: cart.restaurant?.image ?? "",
            height: 50,
            width: 50,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your order from',
                style: Theme.of(context).textTheme.bodySmall),
            Text(cart.restaurant?.name ?? "",
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(restaurant: cart.restaurant),
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
      ],
    );
  }
}
