import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/meal_details/cubit/meal_details_view_model.dart';

import '../../di/di.dart';
import '../../domain/model/Meal.dart';
import '../ar/ar_widget.dart';
import '../common/custom_bottom_navigation_bar.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({this.meal, super.key});

  static const String routeName = 'MealDetailsSc';
  final Meal? meal;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int? _value;
  int quantity = 1;
  bool customIcon = false;

  List<String> sizes = ['Small', 'Medium', 'Large'];
  List<String> prices = ['0', '30', '60'];

  var viewModel = getIt<MealDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MealDetailsViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  //Meal Image
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xff123456),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.meal?.image ?? "",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //Back Icon
                  Positioned(
                    left: 20,
                    top: 46,
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

                  //AR Icon
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ArWidget.routeName);
                            },
                            icon: Icon(
                              Icons.all_inclusive,
                              color: Theme.of(context).primaryColor,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Meal Name
                    Text(
                      widget.meal?.name ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    //Meal Description
                    Text(
                      widget.meal?.description ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    //Meal Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.meal?.currency}${calculateTotalPrice()}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  decrementQuantity();
                                });
                              },
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  incrementQuantity();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //Nutrition Facts
                    Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text(
                            'Nutrition Facts',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          trailing: Icon(customIcon
                              ? Icons.arrow_drop_down_circle
                              : Icons.arrow_drop_down),
                          tilePadding: EdgeInsets.zero,
                          onExpansionChanged: (bool expanded) {
                            setState(
                              () {
                                customIcon = expanded;
                              },
                            );
                          },
                          children: <Widget>[
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Text(
                                'Calories',
                              ),
                              trailing: Text(
                                widget.meal?.calories.toString() ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                              leadingAndTrailingTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Text('Protein'),
                              trailing: Text(
                                widget.meal?.protein.toString() ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                              leadingAndTrailingTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Text('Fat'),
                              trailing: Text(
                                widget.meal?.fat.toString() ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                              leadingAndTrailingTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Text('Carbohydrates'),
                              trailing: Text(
                                widget.meal?.carbohydrates.toString() ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ),
                              leadingAndTrailingTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    //Size of Meal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Choose size of meal:',
                            style: Theme.of(context).textTheme.titleSmall),
                        Text(
                          'Required',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    Text('Choose 1',
                        style: Theme.of(context).textTheme.bodySmall),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        final String sizeName = sizes[index];
                        final String price =
                            '(+${widget.meal?.currency}${prices[index]})';
                        return RadioListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sizeName,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                price,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ],
                          ),
                          contentPadding: EdgeInsets.zero,
                          value: index,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              if (value != null) {
                                widget.meal?.price =
                                    double.parse(prices[index]);
                                calculateTotalPrice();
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 2,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          isMealDetail: true,
          title: 'Add to Cart',
          subTitle: '${widget.meal?.currency} ${calculateTotalPrice()}',
          onPressed: () {
            viewModel.addToCart(
                mealId: widget.meal?.id ?? "",
                restaurantId: widget.meal?.restaurant ?? "");
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  String calculateTotalPrice() {
    num mealPrice = widget.meal?.price ?? 0;
    num totalPrice = mealPrice * quantity;
    return totalPrice.toStringAsFixed(2);
  }

  void incrementQuantity() {
    setState(() {
      quantity = quantity + 1;
    });
  }
}
