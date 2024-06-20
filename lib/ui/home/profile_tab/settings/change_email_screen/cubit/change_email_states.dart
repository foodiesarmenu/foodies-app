import '../../../../../../domain/model/User.dart';

abstract class ChangeEmailStates {}

class ChangeEmailInitialState extends ChangeEmailStates {}

class ChangeEmailLoadingState extends ChangeEmailStates {
  String? loadingMessage;

  ChangeEmailLoadingState({required this.loadingMessage});
}

class GetProfileDataErrorState extends ChangeEmailStates {
  String errorMessage;

  GetProfileDataErrorState({required this.errorMessage});
}

class GetProfileDataSuccessState extends ChangeEmailStates {
  User user;

  GetProfileDataSuccessState({required this.user});
}

class ChangeEmailErrorState extends ChangeEmailStates {
  String errorMessage;

  ChangeEmailErrorState({required this.errorMessage});
}

class ChangeEmailSuccessState extends ChangeEmailStates {
  User user;

  ChangeEmailSuccessState({required this.user});
}
