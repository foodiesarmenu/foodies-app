import 'package:flutter/material.dart';
import 'package:foodies_app/ui/signing/register/register_screen.dart';

import '../../../validation_utils.dart';
import '../../common/form_input_field.dart';
import '../../common/primary_button.dart';
import '../../common/social_sign_in_options.dart';
import '../../welcome/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginSc";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'yehya@gmail.com');

  TextEditingController passwordController =
      TextEditingController(text: '0123456789');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Logo
                Image.asset(
                  'assets/images/app_logo.png',
                ),

                const SizedBox(
                  height: 8,
                ),

                //Welcome
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Form
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormInputField(
                          controller: emailController,
                          hint: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter full name';
                            }
                            if (!ValidationUtils.isValidEmail(text)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          }),

                      FormInputField(
                        controller: passwordController,
                        hint: 'Password',
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

                      const SizedBox(height: 8),

                      //Forget Password
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Color((0xFFA3A3A3)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      //Login Button
                      PrimaryButton(
                        text: 'Login',
                        onPressed: login,
                      ),

                      const SizedBox(height: 8),

                      //Do not have account ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do not have account ?',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              child: Text(
                                ' Sign up',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )),
                        ],
                      ),

                      //Social Connect
                      const SocialSignInOptions(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(WelcomeScreen.routeName);
  }
}
