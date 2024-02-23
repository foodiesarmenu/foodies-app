import 'package:flutter/material.dart';
import 'package:foodies_app/ui/home/home_screen.dart';
import 'package:foodies_app/ui/signing/register/register_screen.dart';

import '../custom_button_widget.dart';
import '../custom_textfield_widget.dart';
import '../social_connect_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginSc";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child:
                //App Logo
                Image.asset(
              'assets/images/app_logo.png',
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  //Welcome
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Form
                  CustomTextFieldWidget(text: 'Email / Phone Number'),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFieldWidget(text: 'Password'),
                  const SizedBox(
                    height: 10,
                  ),

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

                  const SizedBox(height: 10),

                  //Login Button
                  CustomButtonWidget(
                    text: 'Login',
                    onPressed: navigateToHomeScreen,
                  ),

                  //Do not have account ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do not have account ?',
                        style: TextStyle(color: Color((0xFFA3A3A3))),
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
                  const SocialConnectWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToHomeScreen() {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }
}
