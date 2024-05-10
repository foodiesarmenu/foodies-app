import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../otp/otp_code_screen.dart';
import 'button_widget.dart';
import 'intro_text_widget.dart';
import 'phone_field_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "phone-no";
  ForgetPasswordScreen({super.key});
  late String phoneNumber;
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> phoneFormKey = GlobalKey();

  void showProgressIndicator(BuildContext context){
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
      backgroundColor: Colors.white,
      body: Form(
        key: phoneFormKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroTextWidget.buildIntroText(
                'What is your phone Number?',
                'Please enter your phone number to verify your account.',
              ),
              const SizedBox(height: 30,),
              PhoneFieldWidget.buildPhoneFormField(phoneController),
              const SizedBox(height: 30,),
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
