import 'package:flutter/material.dart';

import '../checkout/address_details_widget.dart';
import '../home/profile_tab/settings/myAccount/Address/add_address.dart';

class ChangeAddressScreen extends StatelessWidget {
  const ChangeAddressScreen({super.key});

  static const String routeName = '/change_address_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select delivery address'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const AddressDetailsWidget(isChangeAddress: true);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                ),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pushNamed(AddAddress.routeName);
          },
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
