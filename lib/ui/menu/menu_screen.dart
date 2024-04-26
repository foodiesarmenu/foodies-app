import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../domain/model/Restaurant.dart';
import '../cart/cart_screen.dart';
import '../utils/shared_preference_utils.dart';
import 'cubit/menu_states.dart';
import 'cubit/menu_view_model.dart';
import 'menu_container.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({this.restaurant, super.key});

  final Restaurant? restaurant;
  static const String routeName = 'RestaurantDetailsSc';

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var viewModel = getIt<MenuViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initPage(restaurantId: widget.restaurant?.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<MenuViewModel, MenuStates>(builder: (context, state) {
        switch (state) {
          case Loading():
            return const Center(child: CircularProgressIndicator());
          case Error():
            return Column(
              children: [
                Text(state.errorMessage ?? ""),
                ElevatedButton(
                    onPressed: () {
                      viewModel.initPage(restaurantId: widget.restaurant?.id);
                    },
                    child: const Text('Try Again'))
              ],
            );
          case Success():
            return Scaffold(
              body: MenuContainer(
                restaurant: widget.restaurant!,
                menus: state.menus ?? [],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                backgroundColor: Colors.white,
                child: Badge(
                  label: Text(
                    '${SharedPreferenceUtils.getData(key: 'numOfCartItems') ?? '0'}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            );
        }
        return const Scaffold();
      }),
    );
  }
}
