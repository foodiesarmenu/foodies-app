import '../../../../domain/failures.dart';
import '../../../../domain/model/User.dart';

abstract class ProfileStates {}

class UpdatePasswordInitialState extends ProfileStates {}

class UpdatePasswordLoadingState extends ProfileStates {
  String? loadingMessage;

  UpdatePasswordLoadingState({required this.loadingMessage});
}

class UpdatePasswordErrorState extends ProfileStates {
  Failures errorMessage;

  UpdatePasswordErrorState({required this.errorMessage});
}

class UpdatePasswordSuccessState extends ProfileStates {
  User user;

  UpdatePasswordSuccessState({required this.user});
}
