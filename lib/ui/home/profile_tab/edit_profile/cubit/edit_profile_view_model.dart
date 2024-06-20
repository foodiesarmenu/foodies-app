import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecase/get_profile_data_use_case.dart';
import '../../../../../domain/usecase/update_profile_image_use_case.dart';
import 'edit_profile_states.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileStates> {
  GetProfileDataUseCase getProfileDataUseCase;
  UpdateProfileImageUseCase updateProfileImageUseCase;

  @factoryMethod
  EditProfileViewModel(
      this.getProfileDataUseCase, this.updateProfileImageUseCase)
      : super(EditProfileInitialState());

  getProfileData() async {
    var either = await getProfileDataUseCase.invoke();
    either.fold((error) {
      emit(GetProfileDataErrorState(
          errorMessage: error.errorMessage ?? 'Error'));
    }, (response) {
      emit(GetProfileDataSuccessState(user: response));
    });
  }

  updateProfileImage({required String image}) async {
    emit(EditProfileLoadingState(loadingMessage: 'Updating Profile Image'));
    var either = await updateProfileImageUseCase.invoke(image: image);
    either.fold((error) {
      emit(UpdateProfileImageErrorState(
          errorMessage: error.errorMessage ?? 'Error'));
      print(error.errorMessage);
    }, (response) {
      emit(UpdateProfileImageSuccessState(user: response));
    });
  }
}
