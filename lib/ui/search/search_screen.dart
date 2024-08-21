import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/Restaurant.dart';
import '../home_tab/widgets/restaurant_list.dart';

class SearchScreen extends SearchDelegate {
  SearchScreen({this.restaurants, this.refreshHomeState});

  final List<Restaurant>? restaurants;
  final Function()? refreshHomeState;

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Restaurant>? filter = restaurants
        ?.where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          if (query.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Search Results',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  RestaurantList(
                    filter,
                    refreshState: refreshHomeState,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Restaurant>? filter = restaurants
        ?.where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: RestaurantList(
          filter,
          refreshState: refreshHomeState,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).primaryColor,
          size: 28.sp,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).primaryColor,
        size: 28.sp,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
