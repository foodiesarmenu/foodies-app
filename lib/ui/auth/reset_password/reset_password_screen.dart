import 'package:flutter/material.dart';
import 'package:foodies_app/ui/auth/set_a_new_password/set_a_new_password_screen.dart';
import 'package:foodies_app/ui/common/primary_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "reset_password";

  ResetPasswordScreen({super.key});

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Password reset',
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
                            context, SetANewPasswordScreen.routeName);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
