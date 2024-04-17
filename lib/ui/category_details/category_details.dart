import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../domain/model/Category.dart';
import '../home/home_tab/restaurants/restaurant_list.dart';
import 'category_details_view_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({this.category, super.key});

  static const String routeName = 'CategoryDetailsSc';
  final Category? category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = getIt<CategoryDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initPage(categoryId: widget.category?.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
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
                title: Text(widget.category?.name ?? ""),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.restaurants?.length ?? ""} Restaurants',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
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
