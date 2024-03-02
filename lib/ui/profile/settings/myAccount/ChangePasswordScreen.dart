import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/form_input_field.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = 'change-password';
   ChangePasswordScreen({super.key});

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
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Form(

        key: formKey,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              FormInputField(
                controller: passwordNewController,
                label: 'Current Password',
                hint: 'Current Password',
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
              FormInputField(
                controller: passwordController,
                label: 'New Password',
                hint: 'New Password',
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
              FormInputField(
                controller: passwordConfirmationController,
                label: 'Retype Password',
                hint: 'Retype password',
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
              SizedBox(height: 10.0), // Space before the button
              ElevatedButton(
                onPressed: checkPass,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50.0), // Full-width button
                ),
                child:const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void checkPass() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(SettingsScreen.routeName);
  }
}
