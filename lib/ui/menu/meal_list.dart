import 'package:flutter/material.dart';

import '../../domain/model/Menu.dart';
import '../meal_details/meal_details.dart';
import 'meal_item.dart';

class MealList extends StatelessWidget {
  const MealList({super.key, required this.menus});

  final List<Menu>? menus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        menus?.length ?? 0,
        (menuIndex) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // Menu Title
            Text(
              menus?[menuIndex].name ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 8),

            // List of Meals with Dividers
            Column(
              children: List.generate(
                menus?[menuIndex].meals?.length ?? 0,
                (mealIndex) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetails(
                              meal: menus?[menuIndex].meals?[mealIndex],
                            ),
                          ),
                        );
                      },
                      child: MealItem(
                        menus: menus,
                        menuIndex: menuIndex,
                        mealIndex: mealIndex,
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
