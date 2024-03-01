import 'package:flutter/material.dart';

import '../../../model/category.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final List<Category> categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CategoryCard(category: categories[index]),
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
