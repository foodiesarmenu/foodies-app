import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key, this.onPressed});

  final Function? onPressed;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onPressed!();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            // Add a subtle border to indicate clickability (optional)
            border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 24),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),

                child: Text(
                  'Search for restaurant...',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              ),
              // Optionally include a disabled filter icon for visual consistency
              // IconButton(
              //   icon: const Icon(Icons.filter_alt_outlined, size: 24),
              //   onPressed: null, // Disable the button
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
