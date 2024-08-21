import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar {
  static AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
          size: 28.sp,
        ),
      ),
    );
  }
}
