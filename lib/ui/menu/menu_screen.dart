import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../domain/model/Restaurant.dart';
import '../cart/cart_widget.dart';
import 'menu_container.dart';
import 'menu_view_model.dart';

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
    return BlocBuilder<MenuViewModel, MenuState>(
        bloc: viewModel,
        builder: (context, state) {
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
                    restaurant: widget.restaurant!, menus: state.menus ?? []),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartWidget.routeName);
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
          }
        });
  }
}
