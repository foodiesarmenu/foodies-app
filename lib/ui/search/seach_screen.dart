import 'package:flutter/material.dart';
import '../../domain/model/Restaurant.dart';
import '../home/home_tab/widgets/restaurant_list.dart';

class SearchScreen extends SearchDelegate {
  SearchScreen({this.restaurants});
  final List<Restaurant>? restaurants;
  @override
  List<Widget>? buildActions(BuildContext context) {
return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Restaurant>? filter = restaurants?.where((element) => element.name!.contains(query)).toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
        child: RestaurantList(
          filter,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Restaurant>? filter = restaurants?.where((element) => element.name!.contains(query)).toList();

    return SingleChildScrollView(
        child: Column(
        children: [
          if (query.isNotEmpty)
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
  
}