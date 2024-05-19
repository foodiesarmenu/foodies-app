import 'package:flutter/material.dart';

import '../../../auth/login/login_screen.dart';
import '../../../change_address/change_address_screen.dart';
import '../../../common/custom_app_bar.dart';
import '../../../utils/shared_preference_utils.dart';
import 'change_email_screen/change_email_screen.dart';
import 'change_password/change_password_screen.dart';
import 'my_card/my_card_screen.dart';
import 'settings_button.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Settings'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: [
              // Title section
              Container(
                padding: const EdgeInsets.only(bottom: 16.0), // Add padding
                child: const Row(
                  children: [
                    Text(
                      'My Account', // Use larger font size
                      style: TextStyle(
                        fontSize: 24.0, // Adjust font size as desired
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Account buttons
              Wrap(
                // Use Wrap for adaptive layout
                spacing: 16.0, // Add spacing between buttons
                runSpacing: 16.0, // Add spacing between rows
                children: [
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Change password',
                    routeName: ChangePasswordScreen.routeName,
                    iconData: Icons.password_outlined,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Change email',
                    routeName: ChangeEmailScreen.routeName,
                    iconData: Icons.attach_email_outlined,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'My Addresses',
                    routeName: ChangeAddressScreen.routeName,
                    iconData: Icons.location_on_outlined,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'My Cards',
                    routeName: MyCardScreen.routeName,
                    iconData: Icons.credit_card_outlined,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                ],
              ),
              const Divider(thickness: 1.0),
              // Title section for second four buttons
              Container(
                padding: const EdgeInsets.only(bottom: 16.0), // Add padding
                child: const Row(
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Settings buttons (second four)
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Language',
                    routeName: '/Language',
                    iconData: Icons.language_outlined,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Help center',
                    routeName: '/Help center',
                    iconData: Icons.contact_support_outlined,
                    // announcement_outlined
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Privacy policy',
                    routeName: '/Privacy policy',
                    iconData: Icons.lock_outline,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Terms of service',
                    routeName: '/Terms of service',
                    iconData: Icons.festival_outlined,
                    //foundation_outlined
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'Rate App',
                    routeName: '/Rate App',
                    iconData: Icons.star_border_outlined,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'About App',
                    routeName: '/About App',
                    iconData: Icons.info_outline,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                ],
              ),
              const Divider(thickness: 1.0),
              Column(
                // Use Column for vertical order
                children: [
                  SettingsButton(
                    itemColor: Colors.black,
                    buttonText: 'App Version',
                    routeName: '/App Version',
                    iconData: Icons.verified_outlined,
                    additionalText: '6.1.2',
                  ),
                  const Divider(thickness: 1.0),
                  SettingsButton(
                      itemColor: Colors.red,
                      buttonText: 'Log out',
                      routeName: '/Log out',
                      iconData: Icons.logout_outlined,
                      righticon: Icons.keyboard_arrow_right_rounded,
                      onPressed: () {
                        SharedPreferenceUtils.removeData(key: 'token');
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      }),
                  const Divider(thickness: 1.0),
                  SettingsButton(
                    itemColor: Colors.red,
                    buttonText: 'Delete My Account',
                    routeName: '/Delete My Account',
                    iconData: Icons.person_remove_rounded,
                    righticon: Icons.keyboard_arrow_right_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
