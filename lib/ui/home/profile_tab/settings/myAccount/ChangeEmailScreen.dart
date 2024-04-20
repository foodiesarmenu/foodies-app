import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/ButtonInProfile.dart';
import 'package:foodies_app/ui/common/EditTextInProfile.dart';
import 'package:foodies_app/ui/utils/validation_utils.dart';

import '../../../../common/custom_app_bar.dart';
import '../SettingsScreen.dart';

class ChangeEmailScreen extends StatefulWidget {
  static const String routeName = 'change-email';

  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController email2Controller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context, 'Change Email'),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              //I want here to do a text view not
              EditTextInProfile(
                keyboardType: TextInputType.emailAddress,
                isTextFieldEnabled: false,
                controller: emailController,
                label: 'Current Email',
                hint: 'mahmoud77mezo@gmail.com',
                isSecured: false,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter email';
                  }
                  if (!ValidationUtils.isValidEmail(text)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              EditTextInProfile(
                keyboardType: TextInputType.emailAddress,
                isTextFieldEnabled: true,
                controller: email2Controller,
                label: 'New Email',
                hint: '',
                isSecured: false,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter email';
                  }
                  if (!ValidationUtils.isValidEmail(text)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Space before the button
              ButtonInProfile(
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                text: 'Change Email',
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                },
              ),
            ],
          ),
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
