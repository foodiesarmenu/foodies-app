import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/domain/model/Cart.dart';

import '../change_address/change_address_screen.dart';
import '../menu/menu_screen.dart';

class RestaurantInfoWidget extends StatelessWidget {
  const RestaurantInfoWidget({Key? key, this.isCart = true, required this.cart})
      : super(key: key);

  final Cart? cart;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
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
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(cart?.restaurant?.name ?? "",
                        style: Theme.of(context).textTheme.headline6),
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
                          builder: (context) =>
                              MenuScreen(restaurant: cart?.restaurant),
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
            ),
            if (!isCart)
              const SizedBox(
                height: 16,
              ),
            if (!isCart)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery address',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ChangeAddressScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Change',
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
