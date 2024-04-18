import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/profile_tab/favourite_list.dart';

import '../../common/custom_app_bar.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routeName = "favourite_screen";
   FavouriteScreen({super.key});

  final List<Fav> favs = [
    Fav(
      id: 'ss',
      restaurantName: 'Restaurant Name',
      restaurantCategories: 'fries',
      restaurantRate: '3',
      rateNumbers: '99',
      isFav: true,
      Img: 'assets/images/7oda.png',
    ),
    Fav(
      id: 'ss',
      restaurantName: 'Restaurant Name',
      restaurantCategories: 'pizaa',
      restaurantRate: '5',
      rateNumbers: '70',
      isFav: false,
      Img: 'assets/images/7oda.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Favourite'),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(indent: 30,endIndent: 30,);
        },
        itemCount: favs.length, // Length of the orders list
        itemBuilder: (context, index) {
          final order = favs[index]; // Get the current order
          int rate = int.tryParse(order.restaurantRate) ?? 0; // Convert to integer, default to 0 if parsing fails
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: order.Img,
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
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(order.restaurantName,
                                    style: Theme.of(context).textTheme.titleSmall
                                ),
                              ),
                              InkWell(child: Icon(Icons.favorite, color: Colors.red,))
                            ],
                          ),
                          Text(order.restaurantCategories,
                              style: Theme.of(context).textTheme.bodySmall
                          ),
                          Row(
                            children: [
                              Row(
                                children: List.generate(5, (index) => Icon(
                                  index < rate ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                )),
                              ),
                              SizedBox(width: 5,),
                              Text(order.rateNumbers,
                                  style: Theme.of(context).textTheme.bodySmall
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

              ],
            ),
          );
        },
        //
      ),
    );
  }
}



