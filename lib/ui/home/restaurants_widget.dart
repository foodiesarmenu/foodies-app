import 'package:flutter/material.dart';

import '../../model/restaurant.dart';

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/${restaurant.image}',
          height: 300,
          width: double.infinity,
          fit: BoxFit.fill,
        ),

        //Title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Text(
          restaurant.service,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),

        const SizedBox(
          height: 4,
        ),
        //Service ,etc
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(restaurant.rates, textAlign: TextAlign.center),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(
                    restaurant.destination,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Delivery Cost-Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.access_time_outlined),
                  Text(restaurant.deliveryTime),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.delivery_dining_outlined),
                  Text(restaurant.deliveryCost),
                ],
              ),
            ),
          ],
        ),

        //Sale
        Row(
          children: [
            const Icon(
              Icons.price_change_outlined,
              color: Colors.red,
            ),
            Text(
              restaurant.sale,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
