import 'package:flutter/material.dart';
import 'package:foodies_app/providers/selected_index_provider.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/orders/orders_screen.dart';
import 'package:foodies_app/ui/profile/ProfileScreen.dart';
import 'package:foodies_app/ui/profile/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/ChangePasswordScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyAddressScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyCardScreen.dart';
import 'package:foodies_app/ui/signing/login/login_screen.dart';
import 'package:foodies_app/ui/signing/login_signup.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:  const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          centerTitle: true,
          foregroundColor: Color(0xFF000000),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFA500),
          primary: const Color(0xFFFFA500),
          secondary: const Color(0xFF005959),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      initialRoute: LoginSignupScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        OrdersScreen.routeName: (_) => const OrdersScreen(),
        ProfileScreen.routeName: (_) => ProfileScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen(),
        EditProfileScreen.routeName: (_) => EditProfileScreen(),
        ChangePasswordScreen.routeName: (_) => ChangePasswordScreen(),
        ChangeEmailScreen.routeName: (_) => ChangeEmailScreen(),
        MyAddressScreen.routeName: (_) => MyAddressScreen(),
        MyCardScreen.routeName: (_) => MyCardScreen(),
        LoginSignupScreen.routeName: (_) => LoginSignupScreen(),


      },
    );
  }
}
