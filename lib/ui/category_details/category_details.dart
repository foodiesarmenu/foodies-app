import 'package:flutter/material.dart';

import '../../model/data.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(
      {this.categoryId, super.key, this.numberOfRestaurants = 0});

  static const String routeName = '/category-details';
  final String? categoryId;
  final int numberOfRestaurants;

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
            children: [
              Text(
                '$numberOfRestaurants Restaurants',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
