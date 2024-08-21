import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main_navigation/main_navigation_screen.dart';
import '../menu_scanner/menu_scanner_screen.dart';

class OrderChoiceScreen extends StatefulWidget {
  OrderChoiceScreen({super.key});

  static const String routeName = 'WelcomeSc';

  @override
  State<OrderChoiceScreen> createState() => _OrderChoiceScreenState();
}

class _OrderChoiceScreenState extends State<OrderChoiceScreen> {
  String? username;

  @override
  Widget build(BuildContext context) {
    username = ModalRoute.of(context)?.settings.arguments as String?;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back, ${username ?? 'Foodie'}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                const Text(
                  'How would you like to order\nyour favorite meals today?',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOrderButton(
                      context,
                      icon: Icons.store_outlined,
                      label: 'Onsite',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MenuScannerScreen.routeName);
                      },
                    ),
                    _buildOrderButton(
                      context,
                      icon: Icons.local_shipping_outlined,
                      label: 'Online',
                      onPressed: () {
                        Navigator.pushNamed(
                            context, MainNavigationScreen.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white, // Background color
        ),
        child: Row(
          children: [
            Icon(icon, size: 40.sp, color: Theme.of(context).primaryColor),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
