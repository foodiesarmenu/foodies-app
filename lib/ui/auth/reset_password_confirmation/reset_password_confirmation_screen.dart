import 'package:flutter/material.dart';
import 'package:foodies_app/ui/common/primary_button.dart';

import '../change_password/change_password_screen.dart';

class ResetPasswordConfirmationScreen extends StatelessWidget {
  static const String routeName = "reset_password_confirmation";

  ResetPasswordConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Password reset for $args',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8.0),

                  Text(
                    'Your password has been successfully reset. click confirm to set a new password',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 32.0),
                  // Space before the button
                  PrimaryButton(
                    text: 'Confirm',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ChangePasswordScreen.routeName,
                          arguments: args);
                    },
                  ),
                  // AppTextButton(
                  //   buttonText: 'Confirm',
                  //   backgroundColor: Theme.of(context).primaryColor,
                  //   textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //     color: Colors.white,
                  //     fontSize: 16,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, LoginScreen.routeName);
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
