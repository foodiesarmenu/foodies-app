import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/ButtonInProfile.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';

class MyCardScreen extends StatelessWidget {
  static const String routeName = 'card-screen';
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ButtonInProfile(
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              text: '+ Add new card',
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
