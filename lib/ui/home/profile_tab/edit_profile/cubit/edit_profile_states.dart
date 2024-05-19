import '../../../../../domain/model/User.dart';

abstract class EditProfileStates {}

class EditProfileInitialState extends EditProfileStates {}

class EditProfileLoadingState extends EditProfileStates {
  String? loadingMessage;

  EditProfileLoadingState({required this.loadingMessage});
}

class GetProfileDataErrorState extends EditProfileStates {
  String errorMessage;

  GetProfileDataErrorState({required this.errorMessage});
}

class GetProfileDataSuccessState extends EditProfileStates {
  User user;

  GetProfileDataSuccessState({required this.user});
}
