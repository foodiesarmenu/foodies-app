import 'package:flutter/material.dart';

import '../../common/app_text_button.dart';
import '../../common/app_text_form_field.dart';
import '../login/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = "reset_password";

  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reset Password', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20.0), // Space between title and input fields
              AppTextFormField(
                controller: passwordController,
                hintText: 'Password',
                isObscureText: true,
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
              const SizedBox(height: 10.0), // Space between password and confirm password
              AppTextFormField(
                controller: confirmPasswordController,
                hintText: 'Retype Password',
                isObscureText: true,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter new password';
                  }
                  if (text != passwordController.text ||
                      text.length <= 6) {
                    return "New password did't match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0), // Space before the button
              AppTextButton(
                buttonText: 'Reset Password',
                backgroundColor: Theme.of(context).primaryColor,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
