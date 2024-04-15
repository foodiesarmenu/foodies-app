import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import 'categories/category_list.dart';
import 'home_app_bar/app_search_bar/app_search_bar.dart';
import 'home_app_bar/delivery_address/delivery_address.dart';
import 'home_tab_view_model.dart';
import 'promotions/promotion_list.dart';
import 'restaurants/restaurant_list.dart';
import 'section_title.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeSc';

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
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
                    onPressed: () {
                      viewModel.initPage();
                    },
                    child: const Text('Try Again'))
              ],
            );
          case SuccessState():
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Category
                      const SectionTitle(
                        title: 'Category',
                        subtitle: 'Discover different categories',
                      ),
                      const SizedBox(height: 8),
                      CategoryList(state.categories ?? []),

                      const Divider(
                          height: 30, thickness: 2, color: Colors.grey),

                      //Promotions
                      const SectionTitle(
                        title: 'Promotions',
                        subtitle: 'Wide range of promotions just for you',
                      ),
                      const SizedBox(height: 8),
                      const PromotionList(),

                      const Divider(
                          height: 30, thickness: 2, color: Colors.grey),

                      //Restaurants
                      const SectionTitle(
                          title: 'Restaurants',
                          subtitle: 'Explore various restaurants'),
                      const SizedBox(height: 8),
                      RestaurantList(state.restaurants ?? []),
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
