import 'package:flutter/material.dart';

import '../../domain/model/Menu.dart';

class MealTabItem extends StatefulWidget {
  const MealTabItem({required this.menu,    required this.onTabSelected,
    required this.isSelected, super.key});

  final Menu menu;
  final bool isSelected;
  final Function(String) onTabSelected;

  @override
  State<MealTabItem> createState() => _MealTabItemState();
}

class _MealTabItemState extends State<MealTabItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTabSelected(widget.menu.name ?? "");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : Colors.white),
        child: Text(
          widget.menu.name ?? "",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: widget.isSelected
                    ? Colors.white
                    : Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
