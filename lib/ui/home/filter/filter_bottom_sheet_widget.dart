import 'package:flutter/material.dart';

import 'filter_section.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.filter_alt_outlined,
                size: 32,
                color: Colors.white,
              ),
              Text(
                'Filter',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Rate
              const Text('Rate',
                  style: TextStyle(
                    fontSize: 14,
                  )),
              LinearProgressIndicator(
                backgroundColor: const Color(0xFFD9D9D9),
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                minHeight: 10.0,
                value: 0.2,
                color: Theme.of(context).primaryColor,
              ),

              //Distance
              const Text('Distance',
                  style: TextStyle(
                    fontSize: 14,
                  )),
              LinearProgressIndicator(
                backgroundColor: const Color(0xFFD9D9D9),
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                minHeight: 10.0,
                value: 0.6,
                color: Theme.of(context).primaryColor,
              ),

              //Delivery
              const Text('Delivery',
                  style: TextStyle(
                    fontSize: 14,
                  )),
              LinearProgressIndicator(
                backgroundColor: const Color(0xFFD9D9D9),
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                minHeight: 10.0,
                value: 0.4,
                color: Theme.of(context).primaryColor,
              ),

              const SizedBox(
                height: 20,
              ),

              //Type Section
              FilterSection(
                title: 'Type',
                items: const ['Sandwich', 'Meals', 'Drinks'],
              ),

              //Food Section
              FilterSection(
                title: 'Food',
                items: const ['Chicken', 'Beef', 'Fish'],
              ),

              //Cuisine Section
              FilterSection(
                title: 'Cuisine',
                items: const ['Egyptian', 'Italian', 'Chinese'],
              ),

              const SizedBox(
                height: 30,
              ),

              //Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 35),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Erase all',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 35),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Add to filter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
