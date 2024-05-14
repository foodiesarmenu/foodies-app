import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/utils/validation_utils.dart';

import '../../../di/di.dart';
import '../../common/form_input_field.dart';
import '../../common/primary_button.dart';
import '../../common/social_sign_in_options.dart';
import '../../utils/dialog_utils.dart';
import '../login/login_screen.dart';
import 'cubit/register_states.dart';
import 'cubit/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterSc";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Register Successfully',
              title: 'Success', posActionName: 'ok');
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Logo
                  Image.asset('assets/images/app_logo.png'),

                  const SizedBox(height: 32),

                  //Register
                  Text(
                    textAlign: TextAlign.start,
                    'Create your account',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 16),

                  //Form
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Form
                        FormInputField(
                            isPassword: false,
                            isEmail: false,
                            controller: viewModel.nameController,
                            hint: 'Full Name',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            }
                            ),

                        FormInputField(
                            isPassword: false,
                            isEmail: true,
                            controller: viewModel.emailController,
                            hint: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter email';
                              }
                              if (!ValidationUtils.isValidEmail(text)) {
                                return 'Please enter valid email';
                              }
                              return null;
                            }),

                        FormInputField(
                          isPassword: false,
                          isEmail: false,
                          controller: viewModel.phoneController,
                          hint: 'Phone Number',
                          keyboardType: TextInputType.number,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter phone number';
                            }
                            if (text.length < 9) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                        ),

                        FormInputField(
                          isPassword: true,
                          isEmail: false,
                          controller: viewModel.passwordController,
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
                          isPassword: true,
                          isEmail: false,
                          controller: viewModel.passwordConfirmationController,
                          hint: 'Confirm Password',
                          isSecured: true,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter confirm password';
                            }
                            if (text.length <= 6) {
                              return 'Password should at least 6 chars';
                            }
                            if (text != viewModel.passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        //Register Button
                        PrimaryButton(
                            text: 'Create Account',
                            onPressed: () {
                              viewModel.register();
                            }),

                        const SizedBox(height: 8),

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
