import 'package:flutter/material.dart';

import '../../../model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(children: [
          Container(
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(24.0),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/${restaurant.image}'),
                  fit: BoxFit.fill,
                ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 0.2,
                  offset: Offset(0, 2), // Positive Y offset for bottom shadow
                ),
              ],
            ),
            height: 300,
            width: double.infinity,
          ),
        ]),

        //const SizedBox(height: 8),

        //Title
        Container(
          padding: const EdgeInsets.all(25.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft:  Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 0.2,
                offset: Offset(0, 2), // Positive Y offset for bottom shadow
              ),
            ],

          ),
          child: Column(
            children: [
              Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Restaurant Icon
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), // Set border radius
                      image: DecorationImage(
                        image: AssetImage('assets/images/${restaurant.image}'),
                        fit: BoxFit.cover, // Ensure image fills the container
                      ),
                    ),
                    height: 50,
                    width: 50,
                  ),

                  const SizedBox(
                    width: 8,
                  ),

                  //Restaurant Name/Service
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        restaurant.service,
                        style:
                            TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              //Rate
              Container(
                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                 //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(width: 3,),
                          Text(restaurant.rates, textAlign: TextAlign.center),
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
                          const SizedBox(width: 3,),
                          Text(
                            restaurant.deliveryTime,
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
                          const SizedBox(width: 3,),
                          Text(
                            restaurant.deliveryCost,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),


      ],
    );
  }
}
