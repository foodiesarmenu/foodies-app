import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/profile/ProfileScreen.dart';
import 'package:foodies_app/ui/profile/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/signing/login/login_screen.dart';
import 'package:foodies_app/ui/signing/register/register_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFA500),
          primary: const Color(0xFFFFA500),
          secondary: const Color(0xFFA3A3A3),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      initialRoute: EditProfileScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ProfileScreen.routeName: (_) => ProfileScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen(),
        EditProfileScreen.routeName: (_) => EditProfileScreen(),
      },
    );
  }
}
