import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodies_app/ui/my_bloc_observer.dart';
import 'package:foodies_app/ui/my_theme_data.dart';
import 'package:foodies_app/ui/routing/app_router.dart';
import 'package:foodies_app/ui/utils/shared_preference_utils.dart';
import 'data/api_constants.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiConstants.stripePublishableKey;
  await Stripe.instance.applySettings();
  await SharedPreferenceUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightMode,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
