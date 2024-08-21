import 'package:flutter/material.dart';

import 'filter_section_title.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterTitle(title: title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((item) => Text(item)).toList(),
        ),
      ],
    );
  }
}
