import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../common/form_input_field.dart';
import '../../common/primary_button.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/validation_utils.dart';
import '../login/login_screen.dart';
import 'cubit/change_password_states.dart';
import 'cubit/change_password_view_model.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "set_a_new_password";

  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var viewModel = getIt<ChangePasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String?;

    return BlocListener(
      listener: (context, state) {
        if (state is ChangePasswordLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is ChangePasswordErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'Ok');
        } else if (state is ChangePasswordSuccessState) {
          DialogUtils.hideLoading(context);
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      },
      bloc: viewModel,
      child: Scaffold(
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
                  key: viewModel.formKey,
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
                        controller: viewModel.newPasswordController,
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
                        controller: viewModel.confirmPasswordController,
                        label: 'Retype Password',
                        hint: 'Re enter password',
                        isSecured: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter confirm password';
                          }
                          if (text != viewModel.newPasswordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32.0),
                      PrimaryButton(
                        text: 'Reset Password',
                        onPressed: () {
                          viewModel.changePassword(email: args ?? '');
                        },
                      ),
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
}
