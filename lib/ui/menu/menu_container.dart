import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/menu/meal_tab_item.dart';

import '../../domain/model/Menu.dart';
import '../../domain/model/Restaurant.dart';
import 'meal_list.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer(
      {required this.menus, required this.restaurant, super.key});

  final Restaurant restaurant;
  final List<Menu>? menus;

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Bullets Icon
          Positioned(
            right: 20,
            top: 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Restaurant Details
          Positioned(
            top: 200,
            left: 10,
            right: 10,
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurant.name ?? "",
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.restaurant.category
                                    ?.map((e) => e.name)
                                    .join(", ") ??
                                "",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
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
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      //Restaurant Name/Service
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Delivery fee',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'EGP 14.99',
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '25 mins',
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
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                        indicatorColor: Colors.transparent,
                        onTap: (newIndex) {
                          setState(() {
                            selectedIndex = newIndex;
                          });
                        },
                        isScrollable: true,
                        tabs: widget.menus!
                            .map((menu) => MealTabItem(
                                menu: menu,
                                isSelected: widget.menus?.indexOf(menu) ==
                                    selectedIndex))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                MealList(
                  menus: widget.menus ?? [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
