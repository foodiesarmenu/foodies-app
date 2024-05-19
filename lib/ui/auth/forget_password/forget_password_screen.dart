import 'package:flutter/material.dart';

import '../otp/otp_code_screen.dart';
import 'widgets/button_widget.dart';
import 'widgets/intro_text_widget.dart';
import 'widgets/phone_field_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "phone-no";

  ForgetPasswordScreen({super.key});

  late String phoneNumber;
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> phoneFormKey = GlobalKey();

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

  /*Widget _buildPhoneNumberSubmitedBloc(){
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current){
        return previous != current;
      },
      listener: (context, state){
        if(state is Loading) {
          showProgressIndicator(context);
        }
        if(state is PhoneNumberSubmited){
          Navigator.pop(context)
        }
      }
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        key: phoneFormKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroTextWidget.buildIntroText(
                'What is your phone Number?',
                'Please enter your phone number to reset the password.',
              ),
              const SizedBox(
                height: 30,
              ),
              PhoneFieldWidget.buildPhoneFormField(phoneController),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonWidget.buildNextBtn(
                        () {
                          Navigator.pushNamed(context, OtpCodeScreen.routeName);
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
    );
  }
}
