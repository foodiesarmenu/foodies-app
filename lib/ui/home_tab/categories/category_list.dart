import 'package:flutter/material.dart';

import '../../../domain/model/Category.dart';
import '../../category_details/category_details.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(this.categories, {super.key});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CategoryDetails.routeName,
                    arguments: {'category': categories[index]});
              },
              child: CategoryItem(category: categories[index])),
          itemCount: categories.length ?? 0,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          }),
    );
  }
}
