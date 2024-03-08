import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/home/restaurants/restaurant_item.dart';
import 'package:foodies_app/ui/home/restaurants/restaurant_list_viewmodel.dart';

import '../../restaurant_details/restaurant_details.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  var viewModel = RestaurantListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantListViewModel, RestaurantListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return const Center(child: CircularProgressIndicator());
          case ErrorState():
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            );
          case SuccessState():
            var restaurantList = state.restaurantList;
            return SizedBox(
              child: Column(
                children: List.generate(
                  restaurantList.length,
                  (index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RestaurantDetails.routeName,
                            arguments: {
                              'restaurant': restaurantList[index],
                            },
                          );
                        },
                        child: RestaurantItem(
                          restaurant: restaurantList[index],
                          category: restaurantList[index].category,
                        ),
                      ),
                      if (index < restaurantList.length - 1)
                        const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
