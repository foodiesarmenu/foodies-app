import '../../../../domain/model/ForgetPassword.dart';

abstract class OtpCodeStates {}

class OtpCodeInitialState extends OtpCodeStates {}

class OtpCodeLoadingState extends OtpCodeStates {
  String? loadingMessage;

  OtpCodeLoadingState({required this.loadingMessage});
}

class OtpCodeErrorState extends OtpCodeStates {
  String? errorMessage;

  OtpCodeErrorState({required this.errorMessage});
}

class OtpCodeSuccessState extends OtpCodeStates {
  ForgetPassword forgetPassword;

  OtpCodeSuccessState({required this.forgetPassword});
}
