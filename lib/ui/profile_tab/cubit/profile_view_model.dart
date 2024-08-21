import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecase/get_profile_data_use_case.dart';
import 'profile_states.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  GetProfileDataUseCase getProfileDataUseCase;

  TextEditingController nameController = TextEditingController();

  @factoryMethod
  ProfileViewModel(this.getProfileDataUseCase) : super(ProfileInitialState());

  static ProfileViewModel get(context) {
    return BlocProvider.of<ProfileViewModel>(context);
  }


  getProfileData() async {
    var either = await getProfileDataUseCase.invoke();
    either.fold((error) {
      emit(GetProfileDataErrorState(
          errorMessage: error.errorMessage ?? 'Error'));
    }, (response) {
      emit(GetProfileDataSuccessState(user: response));
    });
  }
}
