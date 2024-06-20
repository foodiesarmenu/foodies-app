import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/di/di.dart';
import 'package:foodies_app/ui/common/button_in_profile.dart';
import 'package:foodies_app/ui/common/edit_text_in_profile.dart';

import '../../../../common/custom_app_bar.dart';
import '../../../../utils/dialog_utils.dart';
import 'cubit/reset_password_states.dart';
import 'cubit/reset_password_view_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'reset-password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var viewModel = getIt<ResetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPasswordLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is ResetPasswordErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage,
              title: 'Error', posActionName: 'Ok');
        } else if (state is ResetPasswordSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context,
              title: 'Success',
              'Password updated successfully',
              posActionName: 'Ok', posAction: () {
            Navigator.pop(context);
          });
        }
      },
      child: Scaffold(
        appBar: CustomAppBar.buildAppBar(context, 'Change Password'),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                EditTextInProfile(
                  controller: viewModel.passwordController,
                  label: 'Current Password',
                  // hint: 'Current Password',
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
                EditTextInProfile(
                  controller: viewModel.passwordNewController,
                  label: 'New Password',
                  //hint: 'New Password',
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
                EditTextInProfile(
                  controller: viewModel.passwordConfirmationController,
                  label: 'Retype Password',
                  // hint: 'Retype password',
                  isSecured: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter confirm password';
                    }
                    if (text != viewModel.passwordNewController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10.0), // Space before the button
                ButtonInProfile(
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  text: 'Change Password',
                  onPressed: () {
                    viewModel.updatePassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
/*void checkPass() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.of(context).pushNamed(SettingsScreen.routeName);
  }*/
}
