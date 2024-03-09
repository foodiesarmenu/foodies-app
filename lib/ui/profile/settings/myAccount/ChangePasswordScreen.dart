import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/ButtonInProfile.dart';
import 'package:foodies_app/ui/common/EditTextInProfile.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';

import '../../../common/custom_app_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = 'change-password';
   const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordNewController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Change Password'),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              EditTextInProfile(
                controller: passwordNewController,
                label: 'Current Password',
               // hint: 'Current Password',
                isSecured: true,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter password';
                  }
                  if (text.length <= 6) {
                    return 'Password should at least 6 chars';
                  }
                  return null;
                },
              ),
              EditTextInProfile(
                controller: passwordController,
                label: 'New Password',
                //hint: 'New Password',
                isSecured: true,
                validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter password';
                    }
                    if (text.length <= 6) {
                      return 'Password should at least 6 chars';
                    }
                    return null;
                  },
              ),
              EditTextInProfile(
                controller: passwordConfirmationController,
                label: 'Retype Password',
               // hint: 'Retype password',
                isSecured: true,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter new password';
                  }
                  if (text != passwordController.text || text.length <= 6) {
                    return "New password did't match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Space before the button
              ButtonInProfile(
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                text: 'Change Password',
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                },
              ),
            ],
          ),
        ),

    );
  }
  /*void checkPass() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(SettingsScreen.routeName);
  }*/
}
