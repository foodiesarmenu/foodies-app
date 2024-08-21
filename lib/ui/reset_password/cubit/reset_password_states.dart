import '../../../../../../domain/model/User.dart';

abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {
  String? loadingMessage;

  ResetPasswordLoadingState({required this.loadingMessage});
}

class ResetPasswordErrorState extends ResetPasswordStates {
  String errorMessage;

  ResetPasswordErrorState({required this.errorMessage});
}

class ResetPasswordSuccessState extends ResetPasswordStates {
  User user;

  ResetPasswordSuccessState({required this.user});
}
