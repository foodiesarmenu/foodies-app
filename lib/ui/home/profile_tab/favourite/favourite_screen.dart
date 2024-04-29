import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/di/di.dart';

import 'cubit/favourite_states.dart';
import 'cubit/favourite_view_model.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routeName = "favouriteSC";

  FavouriteScreen({super.key});

  var viewModel = getIt<FavouriteViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteViewModel, FavouriteStates>(
        bloc: viewModel..getAllFavourites(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Favourite'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: (state is GetAllFavouriteSuccessState)
                ? ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        indent: 30,
                        endIndent: 30,
                      );
                    },
                    itemCount: viewModel.favourites.length,
                    // Length of the orders list
                    itemBuilder: (context, index) {
                      int rate = 10;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: viewModel.favourites[index]
                                            .restaurant!.image ??
                                        "",
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.fill,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress)),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                                viewModel.favourites?[index]
                                                        .restaurant?.name ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                viewModel.DeleteFavourite(
                                                    restaurantId: viewModel
                                                        .favourites![index]
                                                        .restaurant!
                                                        .id!);
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                      Text(
                                          viewModel.favourites?[index]
                                                  .restaurant?.category!
                                                  .map((e) => e.name)
                                                  .join(', ') ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(
                                                5,
                                                (index) => Icon(
                                                      index < rate
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      color: Colors.amber,
                                                    )),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("99",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
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
                  )
                : Center(),
          );
        });
  }
}
