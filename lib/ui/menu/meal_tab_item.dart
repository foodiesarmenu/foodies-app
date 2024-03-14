import 'package:flutter/material.dart';

import '../../domain/model/Menu.dart';

class MealTabItem extends StatelessWidget {
  const MealTabItem({required this.menu, required this.isSelected, super.key});

  final Menu menu;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white),
      child: Text(
        menu.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
