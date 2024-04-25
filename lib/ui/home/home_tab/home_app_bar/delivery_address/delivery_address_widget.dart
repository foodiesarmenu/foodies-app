import 'package:flutter/material.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

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
            const InkWell(
              child: Row(
                children: [
                  Text(
                    'Faculty of Science,Alexandria',
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
