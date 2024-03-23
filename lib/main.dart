import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/ar/ar_widget.dart';
import 'package:foodies_app/ui/auth/login/login_screen.dart';
import 'package:foodies_app/ui/auth/login_signup.dart';
import 'package:foodies_app/ui/auth/register/register_screen.dart';
import 'package:foodies_app/ui/cart/cart_widget.dart';
import 'package:foodies_app/ui/category_details/category_details.dart';
import 'package:foodies_app/ui/home/home_tab.dart';
import 'package:foodies_app/ui/main_navigation/main_navigation.dart';
import 'package:foodies_app/ui/meal_details/meal_details.dart';
import 'package:foodies_app/ui/menu/menu_screen.dart';
import 'package:foodies_app/ui/my_bloc_observer.dart';
import 'package:foodies_app/ui/my_theme_data.dart';
import 'package:foodies_app/ui/orders/orders_tab.dart';
import 'package:foodies_app/ui/profile/ProfileTab.dart';
import 'package:foodies_app/ui/profile/editProfile/EditProfileScreen.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/Address/add_address.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/Address/map_screen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/ChangeEmailScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/ChangePasswordScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyAddressScreen.dart';
import 'package:foodies_app/ui/profile/settings/myAccount/MyCardScreen.dart';
import 'package:foodies_app/ui/splash/splash_screen.dart';
import 'package:foodies_app/ui/utils/shared_preference_utils.dart';
import 'package:foodies_app/ui/welcome/welcome_screen.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  var user = SharedPreferenceUtils.getData(key: 'accessToken');
  print('accessToken: $user');

  String route;
  if (user == null) {
    route = SplashScreen.routeName;
  } else {
    route = WelcomeScreen.routeName;
  }
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(route: route));
}

class MyApp extends StatelessWidget {
  final String route;

  const MyApp({required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemeData.lightMode,
      initialRoute: route,
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
        MapScreen.routeName: (_) => const MapScreen(),
        AddAddress.routeName: (_) => const AddAddress(),
        CategoryDetails.routeName: (_) => const CategoryDetails(),
        CartWidget.routeName: (_) => const CartWidget(),
        MealDetails.routeName: (_) => const MealDetails(),
        ArWidget.routeName: (_) => const ArWidget(),
      },
    );
  }
}
