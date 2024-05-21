import 'package:flutter/material.dart';

import '../../domain/model/OrderEntity.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({required this.cart, super.key});

  final OrderEntity? cart;

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
              Text('Total amount',
                  style: Theme.of(context).textTheme.titleSmall),
              const Spacer(),
              Text('EGP ${cart?.totalPriceAfterDiscount}',
                  style: Theme.of(context).textTheme.titleSmall)
            ]),
          ],
        ),
      ),
    );
  }
}
