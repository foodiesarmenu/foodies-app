import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/ui/my_theme_data.dart';

import '../cart/cart_screen.dart';
import '../home_tab/home_tab.dart';
import '../profile_tab/profile_tab.dart';
import '../utils/shared_preference_utils.dart';
import '../orders_tab/orders_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = 'MainNavScaffold';

  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;
  int? numOfCartItems =
      SharedPreferenceUtils.getData(key: 'numOfCartItems') as int?;
  late List<Widget> tabs;

  void refreshNumOfCartItems() {
    setState(() {
      numOfCartItems =
          SharedPreferenceUtils.getData(key: 'numOfCartItems') as int?;
    });
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      HomeTab(
        refreshHomeState: refreshNumOfCartItems,
      ),
      OrdersTab(refreshHomeState: refreshNumOfCartItems),
      ProfileTab(),
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: (tabs[selectedIndex] == tabs[0])
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: (tabs[selectedIndex] == tabs[0])
            ? Brightness.dark
            : Brightness.light,
        statusBarColor: (tabs[selectedIndex] == tabs[0])
            ? Theme.of(context).primaryColor
            : Colors.white,
      ),
      child: Scaffold(
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 28.sp),
          unselectedIconTheme: IconThemeData(size: 28.sp),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: selectedIndex,
          onTap: (selected) {
            setState(() {
              selectedIndex = selected;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/f_icon_2.png',
                width: 28.sp,
                height: 28.sp,
                color: selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long_outlined,
                size: 28.sp,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28.sp),
              label: 'Account',
            ),
          ],
        ),
        floatingActionButton: (numOfCartItems != 0 && numOfCartItems != null)
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartScreen(
                              refreshMenuState: refreshNumOfCartItems)));
                  // Navigator.pushNamed(context, CartScreen.routeName);
                },
                backgroundColor: Colors.white,
                child: Badge(
                  label: Text(
                    '$numOfCartItems',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
