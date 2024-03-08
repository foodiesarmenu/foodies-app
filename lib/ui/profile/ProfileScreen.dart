import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/main_bottom_nav_bar.dart';
import 'package:foodies_app/ui/profile/ProfileButton.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';

import 'editProfile/EditProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              // Profile picture, name, and country in a row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/7oda.png'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mohamed Hany',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const Text(
                                'Egypt',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              const SizedBox(width: 15.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Theme.of(context).primaryColor,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 3.0),
                                  Text(
                                    'EGP 0.0',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /*IconButton(
                      icon: Icon(Icons.notifications_none),
                    onPressed: () {
                      Navigator.pushNamed(context, '/notification');
                    },
                  ),*/
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none),
                        onPressed: () {
                          Navigator.pushNamed(context, '/notification');
                        },
                      ),
                      Positioned(
                        bottom: 12, // Place the container at the bottom
                        right: 12, // Adjust horizontal position from the right
                        child: Container(
                          alignment: Alignment.center,
                          width: 13,
                          // Adjusted width for smaller size
                          height: 13,
                          // Adjusted height for smaller size
                          padding: const EdgeInsets.all(1.0),
                          // Adjusted padding for smaller size
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '0', // Set your actual additional text here
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  6, // Adjusted font size for smaller size
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //SizedBox(height: 0.0),

              //
              /*
            work here to make the
                           notification
              Account into + settings
              edit profile
            */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Space buttons evenly
                children: [
                  // Edit Profile button
                  const SizedBox(
                    width: 52,
                  ),
                  Container(
                    child: Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, EditProfileScreen.routeName);
                        },
                        child: Text(
                          'Edit Profile',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),

                  // Settings icon button
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                          padding: EdgeInsets
                              .zero, // Remove padding for compact icon
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SettingsScreen.routeName);
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              //SizedBox(height: 24,),
              const Divider(
                thickness: 1.0,
                color: Color(0xFFFFA500),
              ),

              // Navigation buttons
              Column(
                children: [
                  //ProfileButton(buttonText: 'Rewards', routeName: '/Rewards' ,iconData: Icons.card_giftcard),
                  ProfileButton(
                    buttonText: 'Favourite',
                    routeName: '/Favourite',
                    iconData: Icons.favorite_outline_outlined,
                    additionalText: '5',
                  ),
                  ProfileButton(
                    buttonText: 'Rewards',
                    routeName: '/Rewards',
                    iconData: Icons.wallet_giftcard_outlined,
                    additionalText: '1',
                  ),
                  ProfileButton(
                      buttonText: 'Your Orders',
                      routeName: '/Your Orders',
                      iconData: Icons.receipt_long),
                  //assignment_rounded //event_note_outlined
                  ProfileButton(
                      buttonText: 'Offers',
                      routeName: '/Offers',
                      iconData: Icons.local_offer_outlined),
                  //ProfileButtonNotification(buttonText: 'Notifications', routeName: '/Notifications' ,iconData: Icons.notifications_none, additionalText: '5',),
                  ProfileButton(
                    buttonText: 'Vouchers',
                    routeName: '/Vouchers',
                    iconData: Icons.confirmation_num_outlined,
                    additionalText: '2',
                  ),
                  //ProfileButton(buttonText: 'Get Help', routeName: '/Get Help' ,iconData: Icons.help_outline_outlined),
                  //ProfileButton(buttonText: 'About App', routeName: '/About App' ,iconData: Icons.info_outline),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}
