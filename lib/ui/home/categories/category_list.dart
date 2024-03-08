import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category_details/category_details.dart';
import 'category_item.dart';
import 'category_list_viewmodel.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var viewModel = CategoryListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListViewModel, CategoryListState>(
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
            var categoryList = state.categoryList;
            return SizedBox(
              height: 95,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            CategoryDetails.routeName,
                            arguments: {'category': categoryList[index]});
                      },
                      child: CategoryItem(category: categoryList[index])),
                  itemCount: categoryList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 16,
                    );
                  }),
            );
        }
      },
    );
  }
}
