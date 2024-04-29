import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodies_app/ui/ar/ar_widget.dart';
import 'package:foodies_app/ui/auth/login/login_screen.dart';
import 'package:foodies_app/ui/auth/login_signup.dart';
import 'package:foodies_app/ui/auth/register/register_screen.dart';
import 'package:foodies_app/ui/cart/cart_screen.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/change_address/change_address_screen.dart';
import 'package:foodies_app/ui/checkout/checkout_screen.dart';
import 'package:foodies_app/ui/checkout/ordering_splash_screen.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/home/home_tab/home_tab.dart';
import 'package:foodies_app/ui/home/orders_tab/orders_tab.dart';
import 'package:foodies_app/ui/home/profile_tab/ProfileTab.dart';
import 'package:foodies_app/ui/home/profile_tab/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/home/profile_tab/favourite/favourite_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/model/cubit/maps/maps_cubit.dart';
import 'package:foodies_app/ui/home/profile_tab/model/map_response/repository/maps_repo.dart';
import 'package:foodies_app/ui/home/profile_tab/model/map_response/web_services/places_web_services.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/myAccount/Address/add_address.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/myAccount/Address/form_adress_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/myAccount/Address/map_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/myAccount/ChangeEmailScreen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/myAccount/ChangePasswordScreen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/myAccount/MyCardScreen.dart';
import 'package:foodies_app/ui/meal_details/meal_details.dart';
import 'package:foodies_app/ui/menu/menu_screen.dart';
import 'package:foodies_app/ui/my_bloc_observer.dart';
import 'package:foodies_app/ui/my_theme_data.dart';
import 'package:foodies_app/ui/order_details/order_details.dart';
import 'package:foodies_app/ui/payment/payment_screen.dart';
import 'package:foodies_app/ui/splash/splash_screen_controller.dart';
import 'package:foodies_app/ui/utils/shared_preference_utils.dart';
import 'package:foodies_app/ui/welcome/scan_qr.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';

import 'data/api_constants.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiConstants.stripePublishableKey;
  await Stripe.instance.applySettings();
  await SharedPreferenceUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightMode,
      initialRoute: SplashScreenController.routeName,
      routes: {
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        HomeTab.routeName: (_) => const HomeTab(),
        OrdersTab.routeName: (_) => OrdersTab(),
        ProfileTab.routeName: (_) => const ProfileTab(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        EditProfileScreen.routeName: (_) => const EditProfileScreen(),
        ChangePasswordScreen.routeName: (_) => const ChangePasswordScreen(),
        ChangeEmailScreen.routeName: (_) => const ChangeEmailScreen(),
        MyCardScreen.routeName: (_) => const MyCardScreen(),
        LoginSignupScreen.routeName: (_) => const LoginSignupScreen(),
        MenuScreen.routeName: (_) => const MenuScreen(),
        MapScreen.routeName: (context) => BlocProvider.value(
              value: MapsCubit(MapsRepository(PlacesWebservices())),
              // Ensure bloc instance is created once
              child: const MapScreen(),
            ),
        FormAddressScreen.routeName: (_) => FormAddressScreen(),
        ScanQR.routeName: (_) => const ScanQR(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        AddAddress.routeName: (_) => const AddAddress(),
        CategoryDetails.routeName: (_) => const CategoryDetails(),
        CartScreen.routeName: (_) => CartScreen(),
        MealDetails.routeName: (_) => MealDetails(),
        ArWidget.routeName: (_) => const ArWidget(),
        CheckoutScreen.routeName: (_) => const CheckoutScreen(),
        PaymentScreen.routeName: (_) => const PaymentScreen(),
        SplashScreenController.routeName: (_) => const SplashScreenController(),
        OrderingSplashScreen.routeName: (_) => const OrderingSplashScreen(),
        OrderDetails.routeName: (_) => const OrderDetails(),
        ChangeAddressScreen.routeName: (_) => const ChangeAddressScreen(),
        FavouriteScreen.routeName: (_) => FavouriteScreen(),
      },
    );
  }
}
