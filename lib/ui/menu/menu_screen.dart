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
  const MenuScreen(
      {this.restaurantId,
      this.refreshHomeState,
      this.fromScanner = false,
      super.key});

  final Function()? refreshHomeState;
  final String? restaurantId;
  final bool? fromScanner;
  static const String routeName = 'RestaurantDetailsSc';

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var viewModel = getIt<MenuViewModel>();
  int? numOfCartItems =
      SharedPreferenceUtils.getData(key: 'numOfCartItems') as int?;

  @override
  void initState() {
    super.initState();
    viewModel.initPage(restaurantId: widget.restaurantId);
  }

  void refreshMenuState() {
    setState(() {
      numOfCartItems =
          SharedPreferenceUtils.getData(key: 'numOfCartItems') as int?;
      widget.refreshHomeState!();
    });
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
                      viewModel.initPage(restaurantId: widget.restaurantId);
                    },
                    child: const Text('Try Again'))
              ],
            );
          case Success():
            return Scaffold(
              body: MenuContainer(
                fromScanner: widget.fromScanner,
                restaurant: state.restaurant ?? Restaurant(),
                menus: state.menus ?? [],
                isFavourite: viewModel.isFavourite,
                refreshMenuState: refreshMenuState,
              ),
              floatingActionButton:
                  (numOfCartItems != 0 && numOfCartItems != null)
                      ? FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                        refreshMenuState: refreshMenuState)));
                            // Navigator.pushNamed(context, CartScreen.routeName);
                          },
                          backgroundColor: Colors.white,
                          child: Badge(
                            label: Text(
                              '$numOfCartItems',
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
                        )
                      : null,
            );
        }
        return const Scaffold();
      }),
    );
  }
}
