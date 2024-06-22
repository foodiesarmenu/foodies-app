import '../../../../domain/model/AuthResult.dart';

abstract class ChangePasswordStates {}

class ChangePasswordInitialState extends ChangePasswordStates {}

class ChangePasswordLoadingState extends ChangePasswordStates {
  String? loadingMessage;

  ChangePasswordLoadingState({required this.loadingMessage});
}

class ChangePasswordErrorState extends ChangePasswordStates {
  String? errorMessage;

  ChangePasswordErrorState({required this.errorMessage});
}

class ChangePasswordSuccessState extends ChangePasswordStates {
  AuthResult authResult;

  ChangePasswordSuccessState({required this.authResult});
}
