import 'package:flutter/material.dart';
import 'package:foodies_app/ui/ar_widget/ar_widget.dart';
import 'package:foodies_app/ui/cart_widget/cart_widget.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/home_tab/home_tab.dart';
import 'package:foodies_app/ui/item_details/item_details.dart';
import 'package:foodies_app/ui/main_navigation/main_navigation.dart';
import 'package:foodies_app/ui/orders_tab/orders_tab.dart';
import 'package:foodies_app/ui/profile_tab/ProfileTab.dart';
import 'package:foodies_app/ui/profile_tab/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/profile_tab/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/profile_tab/settings/myAccount/ChangeEmailScreen.dart';
import 'package:foodies_app/ui/profile_tab/settings/myAccount/ChangePasswordScreen.dart';
import 'package:foodies_app/ui/profile_tab/settings/myAccount/MyAddressScreen.dart';
import 'package:foodies_app/ui/profile_tab/settings/myAccount/MyCardScreen.dart';
import 'package:foodies_app/ui/restaurant_details/restaurant_details.dart';
import 'package:foodies_app/ui/signing/login/login_screen.dart';
import 'package:foodies_app/ui/signing/login_signup.dart';
import 'package:foodies_app/ui/signing/register/register_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';

import 'di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          centerTitle: true,
          foregroundColor: Color(0xFF000000),
          titleTextStyle: TextStyle(
            color: Color(0xFF000000),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 32,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFA500),
          primary: const Color(0xFFFFA500),
          secondary: const Color(0xFF005959),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      initialRoute: MainNavigationScaffold.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        HomeTab.routeName: (_) => const HomeTab(),
        OrdersTab.routeName: (_) => const OrdersTab(),
        ProfileTab.routeName: (_) => const ProfileTab(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        EditProfileScreen.routeName: (_) => const EditProfileScreen(),
        ChangePasswordScreen.routeName: (_) => const ChangePasswordScreen(),
        ChangeEmailScreen.routeName: (_) => const ChangeEmailScreen(),
        MyAddressScreen.routeName: (_) => const MyAddressScreen(),
        MyCardScreen.routeName: (_) => const MyCardScreen(),
        LoginSignupScreen.routeName: (_) => const LoginSignupScreen(),
        RestaurantDetails.routeName: (_) => const RestaurantDetails(),
        MainNavigationScaffold.routeName: (_) => const MainNavigationScaffold(),
        CategoryDetails.routeName: (_) => const CategoryDetails(),
        CartWidget.routeName: (_) => const CartWidget(),
        ItemDetails.routeName: (_) => const ItemDetails(),
        ArWidget.routeName: (_) => const ArWidget(),
      },
    );
  }
}
