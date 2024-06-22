import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/ar/ar_screen.dart';

import '../../../domain/model/Menu.dart';

class MealItem extends StatefulWidget {
  const MealItem(
      {required this.menus,
      required this.menuIndex,
      required this.mealIndex,
      super.key});

  final List<Menu>? menus;
  final int menuIndex;
  final int mealIndex;

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Meal Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.menus?[widget.menuIndex].meals?[widget.mealIndex].name ??
                    "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.menus?[widget.menuIndex].meals?[widget.mealIndex]
                        .description ??
                    "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${widget.menus?[widget.menuIndex].meals?[widget.mealIndex].currency} ${widget.menus?[widget.menuIndex].meals?[widget.mealIndex].price}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Text(
                  //   widget.menus?[widget.menuIndex].meals?[widget.mealIndex]
                  //           .price
                  //           .toString() ??
                  //       "",
                  //   style: const TextStyle(
                  //     decoration: TextDecoration.lineThrough,
                  //     color: Colors.grey,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: const EdgeInsets.all(4),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           'Add to cart',
                  //           style: TextStyle(
                  //             color: Theme.of(context).primaryColor,
                  //           ),
                  //         ),
                  //         Icon(
                  //           Icons.shopping_cart,
                  //           color: Theme.of(context).primaryColor,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ARScreen.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Explore in AR',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 25,
                            child: Image.asset(
                              'assets/icons/ar2.png',
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Meal Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: widget
                    .menus?[widget.menuIndex].meals?[widget.mealIndex].image ??
                "",
            height: 110,
            width: 110,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
