import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/validation_utils.dart';
import '../otp/otp_code_screen.dart';
import 'cubit/forget_password_states.dart';
import 'cubit/forget_password_view_model.dart';
import 'widgets/button_widget.dart';
import 'widgets/intro_text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "phone-no";

  ForgetPasswordScreen({super.key});

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      }
    );
  }

  var viewModel = getIt<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) async {
        if (state is ForgetPasswordLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is ForgetPasswordErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: state.errorMessage, posActionName: 'Ok');
        } else if (state is ForgetPasswordSuccessState) {
          DialogUtils.hideLoading(context);
          Navigator.pushNamed(context, OtpCodeScreen.routeName,
              arguments: state.forgetPassword.to ?? '');
        }
      },
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
        body: Form(
          key: viewModel.formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroTextWidget.buildIntroText(
                  'What is your email address?',
                  'Please enter your email address to reset the password.',
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(height: 1, fontSize: 18, letterSpacing: 2),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    controller: viewModel.emailController,
                    keyboardType: TextInputType.text,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      if (!ValidationUtils.isValidEmail(text)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // phoneNumber = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonWidget.buildNextBtn(
                      () {
                        viewModel.forgetPassword();
                      },
                      'Next',
                    ),
                  ],
                ),
                // _buildPhoneNumberSubmitedBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
