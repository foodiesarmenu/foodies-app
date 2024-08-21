import 'package:flutter/material.dart';
import 'package:foodies_app/ui/ar/ar_screen.dart';
import 'package:foodies_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:foodies_app/ui/auth/login/login_screen.dart';
import 'package:foodies_app/ui/auth/otp/otp_code_screen.dart';
import 'package:foodies_app/ui/auth/register/register_screen.dart';
import 'package:foodies_app/ui/cart/cart_screen.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/change_address/change_address_screen.dart';
import 'package:foodies_app/ui/checkout/checkout_screen.dart';
import 'package:foodies_app/ui/main_navigation/main_navigation_screen.dart';
import 'package:foodies_app/ui/home_tab/home_tab.dart';
import 'package:foodies_app/ui/orders_tab/orders_tab.dart';
import 'package:foodies_app/ui/edit_profile/edit_profile_screen.dart';
import 'package:foodies_app/ui/favourite/favourite_screen.dart';
import 'package:foodies_app/ui/profile_tab/profile_tab.dart';
import 'package:foodies_app/ui/change_email/change_email_screen.dart';
import 'package:foodies_app/ui/form_address/form_address_screen.dart';
import 'package:foodies_app/ui/maps/map_screen.dart';
import 'package:foodies_app/ui/settings/settings_screen.dart';
import 'package:foodies_app/ui/meal_details/meal_details.dart';
import 'package:foodies_app/ui/menu/menu_screen.dart';
import 'package:foodies_app/ui/menu_scanner/menu_scanner_screen.dart';
import 'package:foodies_app/ui/order_choice/order_choice_screen.dart';
import 'package:foodies_app/ui/order_details/order_details.dart';
import 'package:foodies_app/ui/ordering_splash/ordering_splash_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen_controller.dart';

import '../auth/change_password/change_password_screen.dart';
import '../auth/reset_password_confirmation/reset_password_confirmation_screen.dart';
import '../notifications/notifications_screen.dart';
import '../offers/offers_screen.dart';
import '../reset_password/reset_password_screen.dart';
import '../voucher/voucher_screen.dart';

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
        ResetPasswordScreen.routeName: (_) => const ResetPasswordScreen(),
        ChangeEmailScreen.routeName: (_) => const ChangeEmailScreen(),
        MenuScreen.routeName: (_) => const MenuScreen(),
        MapScreen.routeName: (_) => const MapScreen(),
        FormAddressScreen.routeName: (_) => FormAddressScreen(),
        MenuScannerScreen.routeName: (_) => const MenuScannerScreen(),
        MainNavigationScreen.routeName: (_) => const MainNavigationScreen(),
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
        ResetPasswordConfirmationScreen.routeName: (_) =>
            ResetPasswordConfirmationScreen(),
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
        ChangePasswordScreen.routeName: (_) => ChangePasswordScreen(),
        ARScreen.routeName: (_) => ARScreen(),
        VoucherScreen.routeName: (_) => const VoucherScreen(),
        OffersScreen.routeName: (_) => const OffersScreen(),
        NotificationsScreen.routeName: (_) => const NotificationsScreen(),
      };
}
