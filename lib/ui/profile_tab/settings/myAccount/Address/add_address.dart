import 'package:flutter/material.dart';

import '../../../../common/ButtonInProfile.dart';
import 'map_screen.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  static const String routeName = 'add_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Address'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // this button for adding new address from the user
            ButtonInProfile(
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              text: '+ Add new address',
              onPressed: () {
                Navigator.pushNamed(context, MapScreen.routeName);
                //getLocation();
              },
            )
          ],
        ));
  }
}
