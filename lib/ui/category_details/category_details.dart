import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/home/restaurants/restaurant_item.dart';

import '../../model/data.dart';
import '../home/restaurants/restaurant_list_viewmodel.dart';
import '../restaurant_details/restaurant_details.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(
      {this.categoryId, super.key, this.numberOfRestaurants = 0});

  static const String routeName = '/category-details';
  final String? categoryId;
  final int numberOfRestaurants;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = RestaurantListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Data?> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Data?>;
    final Data? category = arguments['category'];

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.name ?? ""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.numberOfRestaurants} Restaurants',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<RestaurantListViewModel, RestaurantListState>(
                bloc: viewModel,
                builder: (context, state) {
                  switch (state) {
                    case LoadingState():
                      return const Center(child: CircularProgressIndicator());
                    case ErrorState():
                      return Column(
                        children: [
                          Text(state.errorMessage),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Try Again'))
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
