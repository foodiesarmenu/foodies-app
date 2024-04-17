import 'package:flutter/material.dart';

import '../../domain/model/Cart.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({required this.cart, super.key});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Details', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Text(
            'Sub total',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          Text(
            'EGP ${cart.cartTotalPrice.toString()}',
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ]),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Text(
            'Tax',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Text(
            'EGP 0',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Text(
            'Delievery Fees',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
          const Spacer(),
          Text(
            'EGP 0',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Text(
            'Services Fees',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
          const Spacer(),
          Text(
            'EGP 0',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Text('Total amount', style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          Text('EGP ${cart.cartTotalPrice}',
              style: Theme.of(context).textTheme.titleMedium)
        ]),
      ],
    );
  }
}
