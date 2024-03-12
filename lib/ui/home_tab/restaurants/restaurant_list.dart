import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home_tab/restaurants/restaurant_item.dart';

import '../../../domain/model/Restaurant.dart';
import '../../restaurant_details/restaurant_details.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList(this.restaurants, {super.key});

  final List<Restaurant>? restaurants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: List.generate(
          restaurants?.length ?? 0,
          (index) => Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RestaurantDetails.routeName,
                    arguments: {
                      'restaurant': restaurants?[index],
                    },
                  );
                },
                child: RestaurantItem(
                  restaurant: restaurants?[index],
                  category: restaurants![index].category,
                ),
              ),
              if (index < restaurants!.length - 1) const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
