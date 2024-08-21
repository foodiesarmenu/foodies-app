import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.only(top: 8.sp, left: 16.sp, right: 16.sp),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
            // Add a subtle border to indicate clickability (optional)
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 2.sp),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 24.sp),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.sp),
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
