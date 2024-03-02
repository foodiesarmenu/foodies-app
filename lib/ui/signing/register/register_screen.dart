import 'package:flutter/material.dart';
import 'package:foodies_app/validation_utils.dart';

import '../../common/form_input_field.dart';
import '../../common/primary_button.dart';
import '../../common/social_sign_in_options.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterSc";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Image.asset(
                  'assets/images/app_logo.png',
                ),

                const SizedBox(
                  height: 8,
                ),

                //Register
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Form
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Form
                        FormInputField(
                          controller: fullNameController,
                          hint: 'Full Name',
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                        ),

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
                          controller: phoneController,
                          hint: 'Phone Number',
                          keyboardType: TextInputType.number,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter full name';
                            }
                            if (text.length < 9) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                        ),

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

                        FormInputField(
                          controller: passwordConfirmationController,
                          hint: 'Confirm Password',
                          isSecured: true,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter password';
                            }
                            if (text.length <= 6) {
                              return 'Password should at least 6 chars';
                            }
                            if (text != passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        //Register Button
                        PrimaryButton(
                          text: 'Create Account',
                          onPressed: createAccount,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        //Already have Account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account ?',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, LoginScreen.routeName);
                                },
                                child: Text(
                                  ' Sign in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )),
                          ],
                        ),

                        const SocialSignInOptions(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }
}
