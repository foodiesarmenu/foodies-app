import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../utils/dialog_utils.dart';
import '../forget_password/widgets/button_widget.dart';
import '../forget_password/widgets/intro_text_widget.dart';
import '../reset_password_confirmation/reset_password_confirmation_screen.dart';
import 'cubit/otp_code_states.dart';
import 'cubit/otp_code_view_model.dart';

class OtpCodeScreen extends StatefulWidget {
  static const String routeName = "otp_screen";

  OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  var args;
  var viewModel = getIt<OtpCodeViewModel>();

  // void showProgressIndicator(BuildContext context) {
  //   AlertDialog alertDialog = AlertDialog(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     content: Center(
  //       child: CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
  //       ),
  //     ),
  //   );
  //
  //   showDialog(
  //       barrierColor: Colors.white.withOpacity(0),
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         return alertDialog;
  //       });
  // }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as String?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is OtpCodeLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is OtpCodeErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'Ok');
        } else if (state is OtpCodeSuccessState) {
          DialogUtils.hideLoading(context);
          Navigator.pushNamed(
              context, ResetPasswordConfirmationScreen.routeName);
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
        body: Form(
          key: viewModel.formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroTextWidget.buildIntroText(
                  'Verify your email address?',
                  'Enter your 4 digit code numbers sent to you at ',
                  //spanText: '$phoneNumber',
                  spanText: args,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 4; i++)
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          controller: viewModel.otpControllers[i],
                          onSaved: (pin1) {},
                          focusNode: viewModel.focusNodes[i],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          autofocus: i == 0,
                          textInputAction: i < 3
                              ? TextInputAction.next
                              : TextInputAction.done,
                          onChanged: (value) {
                            if (value.length == 1 && i < 3) {
                              viewModel.focusNodes[i + 1].requestFocus();
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonWidget.buildNextBtn(
                      () {
                        viewModel.verifyOTP(email: args);
                      },
                      'Verify',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
