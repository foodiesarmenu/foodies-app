import 'package:flutter/material.dart';

import '../custom_button_widget.dart';
import '../custom_textfield_widget.dart';
import '../login/login_screen.dart';
import '../social_connect_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterSc";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/app_logo.png',
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Form
                  CustomTextFieldWidget(text: 'Full Name'),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFieldWidget(text: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFieldWidget(text: 'Number'),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFieldWidget(text: 'Password'),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFieldWidget(text: 'Confirm Password'),
                  const SizedBox(
                    height: 10,
                  ),

                  //Register Button
                  CustomButtonWidget(
                    text: 'Register',
                    onPressed: navigateToLoginScreen,
                  ),

                  //Aleardy have
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ?',
                        style: TextStyle(color: Color((0xFFA3A3A3))),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            ' Sign in',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SocialConnectWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToLoginScreen() {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }
}
