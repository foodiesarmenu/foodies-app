import 'package:flutter/material.dart';
import 'package:foodies_app/ui/restaurant_details/restaurant_container.dart';

import '../../model/data.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({super.key});

  static const String routeName = 'RestaurantDetailsSc';

  @override
  Widget build(BuildContext context) {
    final Map<String, Data?> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Data?>;
    final Data? restaurant = arguments['restaurant'];
    return Scaffold(
      body: RestaurantContainer(restaurant: restaurant!),
    );
  }
}
