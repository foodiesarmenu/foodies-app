import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/model/CartItem.dart';
import 'cubit/cart_screen_view_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.cart, super.key});

  final CartItem? cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart?.meal?.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'El 3emlak',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        'Edit',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'EGP ${cart?.totalPrice ?? 0}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: cart?.meal?.image ?? "",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      bottom: 0,
                      left: -10,
                      right: -10,
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (cart!.quantity! > 1)
                              IconButton(
                                  onPressed: () {
                                    int counter = cart?.quantity?.toInt() ?? 0;
                                    counter--;
                                    CartScreenViewModel.get(context)
                                        .updateCountInCart(
                                            mealId: cart?.meal?.id ?? "",
                                            quantity: counter);
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Theme.of(context).primaryColor,
                                  ))
                            else
                              IconButton(
                                onPressed: () {
                                  CartScreenViewModel.get(context)
                                      .removeItemFromCart(
                                          mealId: cart?.meal?.id ?? "");
                                },
                                icon: Icon(
                                  Icons.delete_outline_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            Text(cart?.quantity.toString() ?? "0",
                                style: Theme.of(context).textTheme.titleSmall),
                            IconButton(
                              onPressed: () {
                                int counter = cart?.quantity?.toInt() ?? 0;
                                counter++;
                                CartScreenViewModel.get(context)
                                    .updateCountInCart(
                                        mealId: cart?.meal?.id ?? "",
                                        quantity: counter);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
