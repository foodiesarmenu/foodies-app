import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/utils/validation_utils.dart';

import '../../../di/di.dart';
import '../../common/form_input_field.dart';
import '../../common/primary_button.dart';
import '../../utils/dialog_utils.dart';
import '../login/login_screen.dart';
import 'cubit/register_states.dart';
import 'cubit/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterSc";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final viewModel = getIt<RegisterViewModel>();

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
          DialogUtils.showMessage(context, 'Registered Successfully',
              title: 'Success', posActionName: 'ok', posAction: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          });
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
                  const SizedBox(height: 24),

                  //Form
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormInputField(
                          label: 'Full Name',
                          icon: Icons.person_outlined,
                          controller: viewModel.nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),

                        FormInputField(
                          icon: Icons.email_outlined,
                          controller: viewModel.emailController,
                          label: 'Email',
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
                        const SizedBox(height: 12),

                        FormInputField(
                          icon: Icons.phone_outlined,
                          controller: viewModel.phoneController,
                          label: 'Phone Number',
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
                        const SizedBox(height: 12),

                        FormInputField(
                          icon: Icons.lock_outlined,
                          controller: viewModel.passwordController,
                          label: 'Password',
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
                        const SizedBox(height: 12),

                        FormInputField(
                          icon: Icons.lock_outlined,
                          controller: viewModel.passwordConfirmationController,
                          label: 'Confirm Password',
                          isSecured: true,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter confirm password';
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
                          },
                        ),

                        const SizedBox(height: 8),

                        //Already have Account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
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
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            children: [
                              const TextSpan(
                                  text:
                                      'By creating an account, you agree to the '),
                              TextSpan(
                                text: 'privacy policy',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const TextSpan(text: ' and the '),
                              TextSpan(
                                text: 'terms of use',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),

                        // const SocialSignInOptions(),
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
