import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({required this.title, this.subtitle, super.key});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subtitle ?? '',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }
}
