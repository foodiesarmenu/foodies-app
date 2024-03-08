import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/data.dart';

class RestaurantContainer extends StatelessWidget {
  const RestaurantContainer({required this.restaurant, super.key});

  final Data restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              child: CachedNetworkImage(
                imageUrl: restaurant.avatar ?? "",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
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
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            //Restaurant Icon
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: restaurant.avatar ?? "",
                height: 50,
                width: 50,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  restaurant.name ?? "",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  restaurant.category?.map((e) => e.name).join(", ") ?? "",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        //Rate
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  const Text("4.5", textAlign: TextAlign.center),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(
                    "30Mins",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.delivery_dining_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                  Text(
                    "15EGP",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
