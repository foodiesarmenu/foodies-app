import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/categories/category_list.dart';
import 'package:foodies_app/ui/home/promotions/promotion_list.dart';
import 'package:foodies_app/ui/home/restaurants/restaurant_list.dart';
import 'package:foodies_app/ui/home/section_title.dart';

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
        toolbarHeight: 120,
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
                  AppSearchBar()
                ],
              ),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Category
              SectionTitle(
                  title: 'Category', subtitle: 'Discover different categories'),
              SizedBox(height: 8),
              CategoryList(),

              Divider(height: 30, thickness: 4, color: Colors.grey),

              //Promotions
              SectionTitle(
                  title: 'Promotions',
                  subtitle: 'Wide range of promotions just for you'),
              SizedBox(height: 8),
              PromotionList(),

              Divider(height: 30, thickness: 4, color: Colors.grey),

              //Restaurants
              SectionTitle(
                  title: 'Restaurants',
                  subtitle: 'Explore various restaurants'),
              SizedBox(height: 8),
              RestaurantList(),
            ],
          ),
        ),
      ),
    );
  }
}
