import 'package:flutter/material.dart';

import '../../model/restaurant.dart';

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/${restaurant.image}',
              height: 466,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                restaurant.service,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(restaurant.rates, textAlign: TextAlign.center),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(
                    restaurant.destination,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  const Icon(Icons.access_time_outlined),
                  Text(restaurant.deliveryTime),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.delivery_dining_outlined),
                  Text(restaurant.deliveryCost),
                ],
              ),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
