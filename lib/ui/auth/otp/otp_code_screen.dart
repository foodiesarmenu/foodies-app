import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies_app/ui/auth/login/login_screen.dart';
import '../forget_password/button_widget.dart';
import '../forget_password/intro_text_widget.dart';

class OtpCodeScreen extends StatelessWidget {
  static const String routeName = "otp_screen";
  OtpCodeScreen({super.key});

  late final phoneNumber;

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroTextWidget.buildIntroText(
                'Verify your phone Number?',
                'Enter your 4 digit code numbers sent to you at ',
                //spanText: '$phoneNumber',
                spanText: '+20 01551022820',
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
                        onSaved: (pin1) {},
                        focusNode: _focusNodes[i],
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
                        textInputAction:
                            i < 3 ? TextInputAction.next : TextInputAction.done,
                        onChanged: (value) {
                          if (value.length == 1 && i < 3) {
                            _focusNodes[i + 1].requestFocus();
                          }
                        },
                        decoration: InputDecoration(
                          //hintText: "0",
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2, // Border width
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
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    'Verify',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
