import 'package:flutter/material.dart';

import '../../../common/custom_app_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  static const String routeName = 'OffersSc';

  @override
  Widget build(BuildContext context) {
    final List<String> offers = [];

    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Offers'),
      body: offers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_offer,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Offers',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You have no offers at this time.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: offers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.local_offer),
                  title: Text(offers[index]),
                );
              },
            ),
    );
  }
}
