import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/form_input_field.dart';
import 'package:foodies_app/ui/profile/settings/SettingsScreen.dart';
import 'package:foodies_app/validation_utils.dart';

class ChangeEmailScreen extends StatefulWidget {
  static const String routeName = 'change-email';
  ChangeEmailScreen({super.key});

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
      appBar: AppBar(
        title: Text('Change Email'),
      ),
      body: Form(

        key: formKey,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              //I want here to do a text view not
              FormInputField(
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
              FormInputField(
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
              SizedBox(height: 10.0), // Space before the button
              ElevatedButton(
                onPressed: checkPass,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50.0), // Full-width button
                ),
                child:const Text('Change Email'),
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
