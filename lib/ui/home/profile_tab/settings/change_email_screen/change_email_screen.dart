import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/common/button_in_profile.dart';
import 'package:foodies_app/ui/common/edit_text_in_profile.dart';
import 'package:foodies_app/ui/utils/validation_utils.dart';

import '../../../../../di/di.dart';
import '../../../../common/custom_app_bar.dart';
import '../../../../utils/dialog_utils.dart';
import 'cubit/change_email_states.dart';
import 'cubit/change_email_view_model.dart';

class ChangeEmailScreen extends StatefulWidget {
  static const String routeName = 'change-email';

  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  var viewModel = getIt<ChangeEmailViewModel>();

  @override
  void initState() {
    viewModel.getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeEmailViewModel, ChangeEmailStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ChangeEmailLoadingState) {
          DialogUtils.showLoading(
              context, state.loadingMessage ?? 'Updating Email...');
        } else if (state is ChangeEmailErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage,
              title: 'Error', posActionName: 'Ok');
        } else if (state is ChangeEmailSuccessState) {
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
      builder: (context, state) {
        if (state is GetProfileDataSuccessState) {
          return Scaffold(
            appBar: CustomAppBar.buildAppBar(context, 'Change Email'),
            body: Form(
              key: viewModel.formKey,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    //I want here to do a text view not
                    EditTextInProfile(
                      keyboardType: TextInputType.emailAddress,
                      isTextFieldEnabled: false,
                      label: 'Current Email',
                      hint: state.user.email ?? '',
                      isSecured: false,
                      controller: null,
                    ),
                    EditTextInProfile(
                      keyboardType: TextInputType.emailAddress,
                      isTextFieldEnabled: true,
                      controller: viewModel.emailController,
                      label: 'New Email',
                      hint: '',
                      isSecured: false,
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
                    const SizedBox(height: 10.0), // Space before the button
                    ButtonInProfile(
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      text: 'Change Email',
                      onPressed: () {
                        viewModel.changeEmail();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
