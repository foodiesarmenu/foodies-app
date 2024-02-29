import 'package:flutter/material.dart';
import 'package:foodies_app/model/restaurant.dart';
import 'package:foodies_app/ui/home/filter/filter_bottom_sheet_widget.dart';
import 'package:foodies_app/ui/home/restaurants_widget.dart';

import '../common/main_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeSc';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Restaurant> restaurants = Restaurant.getAllRestaurants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 36),
            SearchBar(
                hintText: 'Search.....',
                leading: const Icon(
                  Icons.search,
                  size: 32,
                ),
                trailing: [
                  IconButton(
                    onPressed: () {
                      showFilterBottomSheet();
                    },
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 32,
                    ),
                  ),
                ]),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    RestaurantsWidget(restaurant: restaurants[index]),
                itemCount: restaurants.length,
              ),
            )
          ],
        ),
        bottomNavigationBar: const MainBottomNavBar());
  }

  void showFilterBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const FilterBottomSheetWidget();
        });
  }
}
