import 'package:flutter/material.dart';
import '../../../../common/ButtonInProfile.dart';
import 'maps/map_screen.dart';

class MyAddressesScreen extends StatelessWidget {
  const MyAddressesScreen({super.key});

  static const String routeName = 'AddressesSc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Addresses'),
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
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              color: Colors.yellow,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                    'Cairo, haram, St.xxx, St.12, floor.8, Cairo, haram, St.xxx, St.12, floor.8',
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(width: 8), // Add some space between the icon and text
                Icon(Icons.arrow_forward_ios_rounded), // Add your desired icon here
              ],
            ),
          ),

        ],
      )
    );
  }
}
