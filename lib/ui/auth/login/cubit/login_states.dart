import '../../../../domain/model/AuthResult.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {
  String? loadingMessage;

  LoginLoadingState({required this.loadingMessage});
}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  AuthResult authResult;

  LoginSuccessState({required this.authResult});
}
