import '../../../../domain/failures.dart';
import '../../../../domain/model/User.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {
  String? loadingMessage;

  ProfileLoadingState({required this.loadingMessage});
}

class UpdatePasswordErrorState extends ProfileStates {
  Failures errorMessage;

  UpdatePasswordErrorState({required this.errorMessage});
}

class UpdatePasswordSuccessState extends ProfileStates {
  User user;

  UpdatePasswordSuccessState({required this.user});
}

class GetProfileDataErrorState extends ProfileStates {
  String errorMessage;

  GetProfileDataErrorState({required this.errorMessage});
}

class GetProfileDataSuccessState extends ProfileStates {
  User user;

  GetProfileDataSuccessState({required this.user});
}
