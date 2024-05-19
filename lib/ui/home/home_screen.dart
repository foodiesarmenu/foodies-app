import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/profile_tab/profile_tab.dart';

import '../cart/cart_screen.dart';
import '../utils/shared_preference_utils.dart';
import 'home_tab/home_tab.dart';
import 'orders_tab/orders_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'MainNavScaffold';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  var isOrdering = SharedPreferenceUtils.getData(key: 'isOrdering') ?? false;

  List<Widget> tabs = [
    HomeTab(),
    OrdersTab(),
    //OrdersTab(scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor), // Pass the value
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 24),
        currentIndex: selectedIndex,
        onTap: (selected) {
          setState(() {
            selectedIndex = selected;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: (isOrdering == false)
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              backgroundColor: Colors.white,
              child: Badge(
                label: Text(
                  '${SharedPreferenceUtils.getData(key: 'numOfCartItems') ?? '0'}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
    );
  }
}
