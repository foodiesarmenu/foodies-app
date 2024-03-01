import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/restaurants/restaurant_card.dart';

import '../../../model/restaurant.dart';

class RestaurantList extends StatelessWidget {
  RestaurantList({super.key});

  final List<Restaurant> restaurants = Restaurant.getAllRestaurants();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: List.generate(
          restaurants.length,
          (index) => Column(
            children: [
              RestaurantCard(restaurant: restaurants[index]),
              if (index < restaurants.length - 1) const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
