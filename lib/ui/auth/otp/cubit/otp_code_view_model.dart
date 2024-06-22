import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodies_app/domain/usecase/verify_otp_use_case.dart';
import 'package:injectable/injectable.dart';

import 'otp_code_states.dart';

@injectable
class OtpCodeViewModel extends Cubit<OtpCodeStates> {
  VerifyOTPUseCase verifyOTPUseCase;

  @factoryMethod
  OtpCodeViewModel(this.verifyOTPUseCase) : super(OtpCodeInitialState());
  List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  var formKey = GlobalKey<FormState>();

  Future<void> verifyOTP({required String email}) async {
    if (formKey.currentState!.validate()) {
      emit(OtpCodeLoadingState(loadingMessage: 'loading...'));

      String otpCode =
          otpControllers.map((controller) => controller.text).join();
      print(otpCode);
      print(email);
      var either = await verifyOTPUseCase.invoke(
        email: email,
        code: otpCode,
      );
      either.fold((error) {
        emit(OtpCodeErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(OtpCodeSuccessState(forgetPassword: response));
      });
    }
  }
}
