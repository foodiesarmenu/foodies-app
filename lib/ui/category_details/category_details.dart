import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../di/di.dart';
import '../../domain/model/Category.dart';
import '../home_tab/widgets/restaurant_list.dart';
import 'cubit/category_details_view_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({this.category, this.refreshHomeState, super.key});

  static const String routeName = 'CategoryDetailsSc';
  final Category? category;
  final Function()? refreshHomeState;

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
                title: Text(widget.category?.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w400)),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                    size: 28.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                      RestaurantList(state.restaurants ?? [],
                          refreshState: widget.refreshHomeState),
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
