import 'package:flutter/material.dart';

import '../../domain/model/Menu.dart';

class MealTabItem extends StatelessWidget {
  const MealTabItem({
    required this.menu,
    required this.isSelected,
    required this.onTabSelected,
    super.key,
  });

  final Menu menu;
  final bool isSelected;
  final Function(Menu) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabSelected(menu);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width:1.5,
          ),
          color: Colors.white ,
        ),
        child: Text(
          menu.name ?? '',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).primaryColor ,
          ),
        ),
      ),
    );
  }
}
