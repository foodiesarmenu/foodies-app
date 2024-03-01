import 'package:flutter/material.dart';
import 'package:foodies_app/providers/selected_index_provider.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/profile/ProfileScreen.dart';
import 'package:provider/provider.dart';

import '../orders/orders_screen.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  final List<String> tabs = const [
    HomeScreen.routeName,
    OrdersScreen.routeName,
    ProfileScreen.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
      currentIndex: selectedIndexProvider.selectedIndex,
      onTap: (index) {
        selectedIndexProvider.selectedIndex = index;
        Navigator.of(context).pushNamed(tabs[index]);
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
    );
  }
}
