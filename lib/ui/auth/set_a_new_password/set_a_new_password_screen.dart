import 'package:flutter/material.dart';

import '../../common/form_input_field.dart';
import '../../common/primary_button.dart';
import '../../utils/validation_utils.dart';
import '../login/login_screen.dart';

class SetANewPasswordScreen extends StatefulWidget {
  static const String routeName = "set_a_new_password";

  SetANewPasswordScreen({super.key});

  @override
  State<SetANewPasswordScreen> createState() => _SetANewPasswordScreenState();
}

class _SetANewPasswordScreenState extends State<SetANewPasswordScreen> {
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
                    Text('Set a new password',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8.0),
                    Text(
                      'Create a new password. Ensure it differs from previous ones for security',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 32.0),
                    FormInputField(
                      icon: Icons.lock_outlined,
                      isPassword: true,
                      isEmail: false,
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter your new password',
                      isSecured: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter password';
                        }
                        if (!ValidationUtils.hasMinLength(text)) {
                          return 'Password is too short';
                        }
                        if (!ValidationUtils.hasNumber(text)) {
                          return 'Missing number';
                        }
                        if (!ValidationUtils.hasUpperCase(text)) {
                          return 'Missing uppercase letter';
                        }
                        if (!ValidationUtils.hasSpecialCharacter(text)) {
                          return 'Missing special character';
                        }
                        if (!ValidationUtils.hasLowerCase(text)) {
                          return 'Missing lowercase letter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    FormInputField(
                      icon: Icons.lock_outlined,
                      isPassword: true,
                      isEmail: false,
                      controller: confirmPasswordController,
                      label: 'Retype Password',
                      hint: 'Re enter password',
                      isSecured: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter confirm password';
                        }
                        if (text != passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    PrimaryButton(
                      text: 'Reset Password',
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                    ),
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
