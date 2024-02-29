import 'package:flutter/material.dart';
import 'package:foodies_app/ui/profile/ProfileButton.dart';
import 'package:foodies_app/ui/profile/ProfileButtonNotification.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),*/
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              // Profile picture, name, and country in a row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/MahmoudHossam.png'),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mohamed Hany',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                'Egypt',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(width: 15.0),
                              Row(
                                children: [
                                  Icon(Icons.account_balance_wallet_outlined,
                                    color:  Theme.of(context).primaryColor,
                                    size: 18,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    'EGP 0.0',
                                    style: TextStyle(fontSize: 14.0, color: Theme.of(context).primaryColor),

                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              // Navigation buttons
              Column(
                children: [
                  //ProfileButton(buttonText: 'Rewards', routeName: '/Rewards' ,iconData: Icons.card_giftcard),
                  ProfileButton(buttonText: 'Rewards', routeName: '/Rewards', iconData: Icons.card_giftcard,additionalText: '1',),
                  ProfileButton(buttonText: 'Your Orders', routeName: '/Your Orders' ,iconData: Icons.receipt_long),
                  ProfileButton(buttonText: 'Offers', routeName: '/Offers' ,iconData: Icons.local_offer_outlined),
                  ProfileButtonNotification(buttonText: 'Notifications', routeName: '/Notifications' ,iconData: Icons.notifications_none, additionalText: '5',),
                  ProfileButton(buttonText: 'Vouchers', routeName: '/Vouchers' ,iconData: Icons.offline_bolt_outlined, additionalText: '2',),
                  ProfileButton(buttonText: 'Get Help', routeName: '/Get Help' ,iconData: Icons.help_outline_outlined),
                  ProfileButton(buttonText: 'About App', routeName: '/About App' ,iconData: Icons.info_outline),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



}
