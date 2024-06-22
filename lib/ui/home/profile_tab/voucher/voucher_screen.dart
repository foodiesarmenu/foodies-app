import 'package:flutter/material.dart';

import '../../../common/custom_app_bar.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  static const String routeName = 'VoucherSc';

  @override
  Widget build(BuildContext context) {
    final List<String> vouchers = [];

    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Vouchers'),
      body: vouchers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Vouchers',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You have no vouchers at this time.',
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
              itemCount: vouchers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.card_giftcard),
                  title: Text(vouchers[index]),
                );
              },
            ),
    );
  }
}
