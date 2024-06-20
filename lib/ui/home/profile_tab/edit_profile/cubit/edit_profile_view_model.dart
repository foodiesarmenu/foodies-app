import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/update_profile_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecase/get_profile_data_use_case.dart';
import '../../../../../domain/usecase/update_profile_image_use_case.dart';
import 'edit_profile_states.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileStates> {
  GetProfileDataUseCase getProfileDataUseCase;
  UpdateProfileImageUseCase updateProfileImageUseCase;
  UpdateProfileUseCase updateProfileUseCase;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @factoryMethod
  EditProfileViewModel(this.getProfileDataUseCase,
      this.updateProfileImageUseCase, this.updateProfileUseCase)
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

  Future<void> updateProfile({String? name, String? phone}) async {
    emit(EditProfileLoadingState(loadingMessage: 'Updating Profile Info'));
    var either = await updateProfileUseCase.invoke(
        name: nameController.text, phone: phoneController.text);
    either.fold((error) {
      print(error.errorMessage);
      emit(
          UpdateProfileErrorState(errorMessage: error.errorMessage ?? 'Error'));
    }, (response) {
      emit(UpdateProfileSuccessState(user: response));
    });
  }
}
