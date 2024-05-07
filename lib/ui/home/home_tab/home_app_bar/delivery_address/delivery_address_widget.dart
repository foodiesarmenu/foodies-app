import 'package:flutter/material.dart';

import '../../../../../domain/model/DeliveryAddress.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({required this.address,super.key});
final DeliveryAddress? address;

  @override

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivering To',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(
              height: 8,
            ),
             InkWell(
              child: Row(
                children: [
                  Text(
                    '${address?.firstAddress ?? 'No Address Defined'} ${address?.secondAddress ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
