import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/change_email_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/usecase/get_profile_data_use_case.dart';
import 'change_email_states.dart';

@injectable
class ChangeEmailViewModel extends Cubit<ChangeEmailStates> {
  GetProfileDataUseCase getProfileDataUseCase;
  ChangeEmailUseCase changeEmailUseCase;

  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @factoryMethod
  ChangeEmailViewModel(this.getProfileDataUseCase, this.changeEmailUseCase)
      : super(ChangeEmailInitialState());

  getProfileData() async {
    var either = await getProfileDataUseCase.invoke();
    either.fold((error) {
      emit(GetProfileDataErrorState(
          errorMessage: error.errorMessage ?? 'Error'));
    }, (response) {
      emit(GetProfileDataSuccessState(user: response));
    });
  }

  Future<void> changeEmail() async {
    if (formKey.currentState!.validate()) {
      emit(ChangeEmailLoadingState(loadingMessage: 'Changing Email...'));
      var either = await changeEmailUseCase.invoke(email: emailController.text);
      either.fold((error) {
        emit(
            ChangeEmailErrorState(errorMessage: error.errorMessage ?? 'Error'));
      }, (response) {
        emit(ChangeEmailSuccessState(user: response));
      });
    }
  }
}
