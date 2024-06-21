import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/menu/cubit/menu_view_model.dart';
import 'package:foodies_app/ui/menu/widgets/meal_list.dart';
import 'package:foodies_app/ui/menu/widgets/meal_tab_item.dart';
import 'package:foodies_app/ui/order_choice/order_choice_screen.dart';

import '../../domain/model/Menu.dart';
import '../../domain/model/Restaurant.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer(
      {required this.isFavourite,
      required this.menus,
      required this.restaurant,
      this.refreshMenuState,
      this.fromScanner = false,
      super.key});

  final Restaurant restaurant;
  final List<Menu>? menus;
  final bool isFavourite;
  final Function()? refreshMenuState;
  final bool? fromScanner;

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  int selectedIndex = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToMenu(String menuName) {
    final index = widget.menus?.indexWhere((menu) => menu.name == menuName);
    if (index != null && index >= 0) {
      _scrollController.animateTo(
        (index * 400).toDouble(), // Adjust 400 according to your meal list item height
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: [
          //Restaurant Cover
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xff123456),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  widget.restaurant.image ?? "",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),

          //Back Icon
          Positioned(
            left: 20,
            top: 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    if (widget.fromScanner == true) {
                      Navigator.pushNamed(context, OrderChoiceScreen.routeName);
                    } else {
                      widget.refreshMenuState!();
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),

          //Bullets Icon
          // Positioned(
          //   right: 20,
          //   top: 30,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(32),
          //         color: Colors.white,
          //       ),
          //       child: IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.more_horiz,
          //           color: Theme.of(context).primaryColor,
          //           size: 32,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          //Restaurant Details
          Positioned(
            top: 180,
            left: 16,
            right: 16,
            child: Container(
              height: 180,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: .5),
                  left: BorderSide(color: Colors.grey, width: .5),
                  right: BorderSide(color: Colors.grey, width: .5),
                  bottom: BorderSide(color: Colors.grey, width: .5),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      //Restaurant Icon
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: widget.restaurant.image ?? "",
                          height: 75,
                          width: 75,
                          fit: BoxFit.fill,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      //Restaurant Name/Service
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.restaurant.name ?? "",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                //Icon(
                                //   Icons.verified,
                                //   color: Theme.of(context).primaryColor,
                                // ),
                                InkWell(
                                  child: widget.isFavourite
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                  onTap: () {
                                    MenuViewModel.get(context).addToFavourite(
                                        restaurantId:
                                            widget.restaurant.id ?? "");
                                  },
                                ),
                              ],
                            ),
                            Text(
                              widget.restaurant.category
                                      ?.map((e) => e.name)
                                      .join(", ") ??
                                  "",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '4.6',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                Text('(14.200 Ratings)',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      //Restaurant Service
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Delivery fee',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'EGP 0',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Delivery Time',
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '30 mins',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Delivered by',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              widget.restaurant.name ?? "",
                              maxLines: 1,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Rest of Page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 350,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff123456),
                  ),
                ),
                DefaultTabController(
                  length: widget.menus?.length ?? 0,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      TabBar(
                        onTap: (newIndex) {
                          setState(() {
                            selectedIndex = newIndex;
                          });
                        },
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        tabs: widget.menus!
                            .map(
                              (menu) => MealTabItem(
                                menu: menu,
                                isSelected: widget.menus?.indexOf(menu) ==
                                    selectedIndex,
                          onTabSelected: (selectedMenu) {
                            setState(() {
                              selectedIndex = widget.menus?.indexOf(selectedMenu) ?? 0;
                            });
                            scrollToMenu(selectedMenu.name ?? '');
                          },
                        ),
                        ).toList(),
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //Meal List
                MealList(
                  menus: widget.menus ?? [],
                  refreshMenuState: widget.refreshMenuState,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
