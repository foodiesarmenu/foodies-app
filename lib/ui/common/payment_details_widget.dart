import 'package:flutter/material.dart';

import '../../domain/model/OrderEntity.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({required this.cart, super.key});

  final OrderEntity? cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .5),
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Details',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            Expanded(
              child: Text(
                'Subtotal',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Text(
              'EGP ${cart?.orderTotalPrice.toString()}',
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ]),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            Expanded(
              child: Text(
                'Discount',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text(
              '% ${cart?.discount.toString()}',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ]),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            Expanded(
              child: Text(
                'Tax',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
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
              'Delivery fees',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.info_outline,
              size: 16,
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
              'Services fees',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.info_outline,
              size: 16,
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
            Text('Total amount', style: Theme.of(context).textTheme.titleSmall),
            const Spacer(),
            Text(
              'EGP ${cart?.totalPriceAfterDiscount != 0 ? cart?.totalPriceAfterDiscount : cart?.orderTotalPrice}',
              style: Theme.of(context).textTheme.titleSmall,
            )
          ]),
        ],
      ),
    );
  }
}
