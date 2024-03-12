import 'package:flutter/material.dart';

import '../../domain/model/Category.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(
      {this.categoryId, super.key, this.numberOfRestaurants = 0});

  static const String routeName = 'CategoryDetailsSc';
  final String? categoryId;
  final int numberOfRestaurants;

  @override
  Widget build(BuildContext context) {
    final Map<String, Category?> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category?>;
    final Category? category = arguments['category'];

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
                '$numberOfRestaurants Restaurants',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
