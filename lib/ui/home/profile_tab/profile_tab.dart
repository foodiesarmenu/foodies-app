import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/home/profile_tab/cubit/profile_states.dart';
import 'package:foodies_app/ui/home/profile_tab/favourite/favourite_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/settings/settings_screen.dart';
import 'package:foodies_app/ui/home/profile_tab/voucher/voucher_screen.dart';

import '../../../di/di.dart';
import 'cubit/profile_view_model.dart';
import 'edit_profile/edit_profile_screen.dart';
import 'notifications/notifications_screen.dart';
import 'offers/offers_screen.dart';
import 'profile_button.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'profile';

  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final viewModel = getIt<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileStates>(
      bloc: viewModel..getProfileData(),
      builder: (context, state) {
        return (state is GetProfileDataSuccessState)
            ? SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 46),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //profile image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                    imageUrl: state.user.image ?? '',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.user.name ?? 'Yehya Gamal',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      const Text(
                                        'Egypt',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      const SizedBox(width: 15.0),
                                      // Row(
                                      //   children: [
                                      //     Icon(
                                      //       Icons
                                      //           .account_balance_wallet_outlined,
                                      //       color:
                                      //           Theme.of(context).primaryColor,
                                      //       size: 18,
                                      //     ),
                                      //     const SizedBox(width: 3.0),
                                      //     Text(
                                      //       'EGP 0.0',
                                      //       style: TextStyle(
                                      //           fontSize: 14.0,
                                      //           color: Theme.of(context)
                                      //               .primaryColor),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.notifications_none),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, NotificationsScreen.routeName);
                                },
                              ),
                              Positioned(
                                bottom: 12, // Place the container at the bottom
                                right:
                                    12, // Adjust horizontal position from the right
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 52,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, EditProfileScreen.routeName,
                                    arguments: viewModel);
                              },
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
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
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFFFA500),
                      ),

                      // Navigation buttons
                      Column(
                        children: [
                          ProfileButton(
                            buttonText: 'Favourites',
                            iconData: Icons.favorite_outline_outlined,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, FavouriteScreen.routeName);
                            },
                            additionalText: '',
                          ),
                          // ProfileButton(
                          //   buttonText: 'Rewards',
                          //   routeName: '/Rewards',
                          //   iconData: Icons.wallet_giftcard_outlined,
                          //   additionalText: '',
                          // ),
                          ProfileButton(
                              buttonText: 'Offers',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, OffersScreen.routeName);
                              },
                              additionalText: '',
                              iconData: Icons.local_offer_outlined),
                          ProfileButton(
                            buttonText: 'Vouchers',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, VoucherScreen.routeName);
                            },
                            iconData: Icons.confirmation_num_outlined,
                            additionalText: '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
