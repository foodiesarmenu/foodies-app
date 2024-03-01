import 'package:flutter/material.dart';

import '../../../model/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/${category.image}'),
                fit: BoxFit.cover, // Ensure image fills the container
              ),
            ),
            width: 90,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          category.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
