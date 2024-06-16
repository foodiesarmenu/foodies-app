import 'package:flutter/material.dart';
import 'package:foodies_app/ui/ar/ar_screen.dart';
import 'package:foodies_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:foodies_app/ui/auth/login/login_screen.dart';
import 'package:foodies_app/ui/auth/login_signup.dart';
import 'package:foodies_app/ui/auth/otp/otp_code_screen.dart';
import 'package:foodies_app/ui/auth/register/register_screen.dart';
import 'package:foodies_app/ui/auth/reset_password/reset_password_screen.dart';
import 'package:foodies_app/ui/cart/cart_screen.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/change_address/change_address_screen.dart';
import 'package:foodies_app/ui/checkout/checkout_screen.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/home/home_tab/home_tab.dart';
import 'package:foodies_app/ui/home/orders_tab/orders_tab.dart';
import 'package:foodies_app/ui/home/profile_tab/edit_profile/edit_profile_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/favourite/favourite_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/profile_tab.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/change_email_screen/change_email_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/change_password/change_password_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/my_addresses/form_address/form_address_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/my_addresses/maps/map_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/my_addresses/my_addresses_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/my_card/my_card_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/settings_screen.dart';
import 'package:foodies_app/ui/meal_details/meal_details.dart';
import 'package:foodies_app/ui/menu/menu_screen.dart';
import 'package:foodies_app/ui/menu_scanner/menu_scanner_screen.dart';
import 'package:foodies_app/ui/order_choice/order_choice_screen.dart';
import 'package:foodies_app/ui/order_details/order_details.dart';
import 'package:foodies_app/ui/ordering_splash_screen/ordering_splash_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen_controller.dart';

import '../auth/set_a_new_password/set_a_new_password_screen.dart';

class AppRouter {
  static String initialRoute = SplashScreenController.routeName;

  static Map<String, WidgetBuilder> get routes => {
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        OrderChoiceScreen.routeName: (_) => OrderChoiceScreen(),
        HomeTab.routeName: (_) => const HomeTab(),
        OrdersTab.routeName: (_) => OrdersTab(),
        ProfileTab.routeName: (_) => ProfileTab(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        EditProfileScreen.routeName: (_) => const EditProfileScreen(),
        ChangePasswordScreen.routeName: (_) => const ChangePasswordScreen(),
        ChangeEmailScreen.routeName: (_) => const ChangeEmailScreen(),
        MyCardScreen.routeName: (_) => const MyCardScreen(),
        LoginSignupScreen.routeName: (_) => const LoginSignupScreen(),
        MenuScreen.routeName: (_) => const MenuScreen(),
        MapScreen.routeName: (_) => const MapScreen(),
        FormAddressScreen.routeName: (_) => FormAddressScreen(),
        MenuScannerScreen.routeName: (_) => const MenuScannerScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        MyAddressesScreen.routeName: (_) => const MyAddressesScreen(),
        CategoryDetails.routeName: (_) => const CategoryDetails(),
        CartScreen.routeName: (_) => CartScreen(),
        MealDetails.routeName: (_) => MealDetails(),
        CheckoutScreen.routeName: (_) => const CheckoutScreen(),
        SplashScreenController.routeName: (_) => const SplashScreenController(),
        OrderingSplashScreen.routeName: (_) => const OrderingSplashScreen(),
        OrderDetails.routeName: (_) => OrderDetails(),
        ChangeAddressScreen.routeName: (_) => ChangeAddressScreen(),
        FavouriteScreen.routeName: (_) => FavouriteScreen(),
        OtpCodeScreen.routeName: (_) => OtpCodeScreen(),
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
        ResetPasswordScreen.routeName: (_) => ResetPasswordScreen(),
        SetANewPasswordScreen.routeName: (_) => SetANewPasswordScreen(),
        ARScreen.routeName: (_) => ARScreen(),
      };
}
