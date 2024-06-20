import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/home_tab/widgets/restaurant_item.dart';

import '../../../../domain/model/Restaurant.dart';
import '../../../menu/menu_screen.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList(this.restaurants, {this.refreshState, super.key});

  final Function()? refreshState;
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(
                        restaurantId: restaurants?[index].id,
                        refreshHomeState: refreshState,
                      ),
                    ),
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
