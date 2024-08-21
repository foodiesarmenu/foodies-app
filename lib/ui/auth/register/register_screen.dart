import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Logo
                  Image.asset(
                    'assets/images/app_logo_new.png',
                    height: 175.h,
                    width: double.infinity,
                  ),

                  //Register
                  Text(
                    textAlign: TextAlign.start,
                    'Create your account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),

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
                        SizedBox(height: 12.h),

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
                        SizedBox(height: 12.h),

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
                        SizedBox(height: 12.h),

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
                        SizedBox(height: 12.h),

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

                        SizedBox(height: 16.h),

                        //Register Button
                        PrimaryButton(
                          text: 'Create Account',
                          onPressed: () {
                            viewModel.register();
                          },
                        ),

                        SizedBox(height: 8.h),

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

                        SizedBox(height: 16.h),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12.sp,
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
