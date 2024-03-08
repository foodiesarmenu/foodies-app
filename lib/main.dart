import 'package:flutter/material.dart';
import 'package:foodies_app/providers/selected_index_provider.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/orders/orders_screen.dart';
import 'package:foodies_app/ui/profile/ProfileScreen.dart';
import 'package:foodies_app/ui/profile/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/ChangePasswordScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyAddressScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyCardScreen.dart';
import 'package:foodies_app/ui/restaurant_details/restaurant_details.dart';
import 'package:foodies_app/ui/signing/login/login_screen.dart';
import 'package:foodies_app/ui/signing/register/register_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'ui/profile/settings/myAccount/ChangeEmailScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SelectedIndexProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFA500),
          primary: const Color(0xFFFFA500),
          secondary: const Color(0xFF005959),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF000000),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        OrdersScreen.routeName: (_) => const OrdersScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        EditProfileScreen.routeName: (_) => const EditProfileScreen(),
        ChangePasswordScreen.routeName: (_) => const ChangePasswordScreen(),
        ChangeEmailScreen.routeName: (_) => const ChangeEmailScreen(),
        MyAddressScreen.routeName: (_) => const MyAddressScreen(),
        MyCardScreen.routeName: (_) => const MyCardScreen(),
        RestaurantDetails.routeName: (_) => const RestaurantDetails(),
        CategoryDetails.routeName: (_) => CategoryDetails(),
      },
    );
  }
}
