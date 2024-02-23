import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 32),
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home_icon.png')),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/bag_icon.png')),
            label: 'Bag'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/orders_icon.png')),
            label: 'Orders'),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/profile_icon.png')),
          label: 'Profile',
        ),
      ],
    );
  }
}
