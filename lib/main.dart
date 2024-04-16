import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/home/home_tab.dart';
import 'package:foodies_app/ui/main_navigation/main_navigation.dart';
import 'package:foodies_app/ui/meal_details/item_details.dart';
import 'package:foodies_app/ui/menu/menu_screen.dart';
import 'package:foodies_app/ui/orders/orders_tab.dart';
import 'package:foodies_app/ui/profile/ProfileTab.dart';
import 'package:foodies_app/ui/profile/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/Address/add_address.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/Address/form_adress_screen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/Address/map_screen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/ChangeEmailScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/ChangePasswordScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyAddressScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyCardScreen.dart';
import 'package:foodies_app/ui/signing/login/login_screen.dart';
import 'package:foodies_app/ui/signing/login_signup.dart';
import 'package:foodies_app/ui/signing/register/register_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen.dart';
import 'package:foodies_app/ui/welcome/scan_qr.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';

import 'cubit/maps/maps_cubit.dart';
import 'model/map_response/repository/maps_repo.dart';
import 'model/map_response/web_services/places_web_services.dart';

void main() {
  //configureDependencies();
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
      initialRoute: WelcomeScreen.routeName,
      //MainNavigationScaffold
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
        MenuScreen.routeName: (_) => const MenuScreen(),

        MainNavigationScaffold.routeName: (_) => const MainNavigationScaffold(),
        //
        //MapScreen.routeName: (_) => const MapScreen(),
        MapScreen.routeName: (context) => BlocProvider.value(
          value: MapsCubit(MapsRepository(PlacesWebservices())), // Ensure bloc instance is created once
          child: const MapScreen(),
        ),
        //
        AddAddress.routeName: (_) => const AddAddress(),
        CategoryDetails.routeName: (_) => const CategoryDetails(),

        //CartWidget.routeName: (_) => const CartWidget(),
        MealDetails.routeName: (_) => const MealDetails(),
        //ArWidget.routeName: (_) => const ArWidget(),

        FormAddressScreen.routeName: (_) => FormAddressScreen(),
        ScanQR.routeName: (_) => ScanQR(),


      },
    );
  }
}
