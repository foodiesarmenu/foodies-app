import 'package:flutter/material.dart';

import '../filter_bottom_sheet/filter_bottom_sheet.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search for meal or restaurant...',
          prefixIcon: const Icon(Icons.search, size: 24),
          suffixIcon: IconButton(
            onPressed: () {
              showFilterBottomSheet();
            },
            icon: const Icon(Icons.filter_alt_outlined, size: 24),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // Adjust padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust border radius
            borderSide: const BorderSide(
                color: Colors.white, width: 1.0), // Customize border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0), // Highlight on focus
          ),
        ),
      ),
    );
  }

  void showFilterBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const FilterBottomSheet();
        });
  }
}
