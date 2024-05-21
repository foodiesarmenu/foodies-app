import 'package:flutter/material.dart';

import '../../domain/model/OrderEntity.dart';
import '../cart/cubit/cart_screen_view_model.dart';
import 'cart_item_widget.dart';

class CartItemListWidget extends StatelessWidget {
  const CartItemListWidget(
      {this.viewModel,
      required this.cart,
      this.isCart = true,
      this.refreshMenuState,
      super.key});

  final bool isCart;
  final OrderEntity? cart;
  final CartScreenViewModel? viewModel;
  final Function()? refreshMenuState;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Order Details',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                //Clear Cart
                isCart
                    ? InkWell(
                        onTap: () async {
                          await viewModel?.clearCart();
                          refreshMenuState!();
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.grey,
                            ),
                            Text('Clear Cart',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      )
                    : Text('Total cart items: ${cart?.noOfOrderItems}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            )),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            //Cart Items
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cart?.orderItems?.length ?? 0,
              itemBuilder: (context, index) => CartItemWidget(
                  cart: cart?.orderItems?[index],
                  noOfCartItems: cart?.noOfOrderItems?.toInt(),
                  isCart: isCart,
                  cartViewModel: viewModel),
              separatorBuilder: (context, index) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
