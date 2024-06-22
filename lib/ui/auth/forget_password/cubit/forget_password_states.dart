import '../../../../domain/model/ForgetPassword.dart';

abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {
  String? loadingMessage;

  ForgetPasswordLoadingState({required this.loadingMessage});
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  String? errorMessage;

  ForgetPasswordErrorState({required this.errorMessage});
}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  ForgetPassword forgetPassword;

  ForgetPasswordSuccessState({required this.forgetPassword});
}
