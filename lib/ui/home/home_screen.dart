import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/categories/category_list.dart';
import 'package:foodies_app/ui/home/promotions/promotion_list.dart';
import 'package:foodies_app/ui/home/restaurants/restaurant_list.dart';

import '../common/main_bottom_nav_bar.dart';
import 'app_search_bar/app_search_bar.dart';
import 'delivery_address/delivery_address.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeSc';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD3D3D3),
        toolbarHeight: 110,
        actions: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DeliveryAddress(),
                  SizedBox(
                    height: 8,
                  ),
                  AppSearchBar(),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Category
              buildSectionTitle(
                  title: 'Category', subtitle: 'Discover different categories'),
              const SizedBox(height: 8),
              CategoryList(),

              const Divider(height: 30, thickness: 4, color: Colors.grey),

              //Promotions
              buildSectionTitle(
                  title: 'Promotions',
                  subtitle: 'Wide range of promotions just for you'),
              const SizedBox(height: 8),
              const PromotionList(),

              const Divider(height: 30, thickness: 4, color: Colors.grey),

              //Restaurants
              buildSectionTitle(
                  title: 'Restaurants',
                  subtitle: 'Explore various restaurants'),
              const SizedBox(height: 8),
              RestaurantList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }

  Widget buildSectionTitle({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subtitle,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }
}
