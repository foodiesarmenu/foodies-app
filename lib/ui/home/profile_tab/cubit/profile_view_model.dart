import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecase/update_password_use_case.dart';
import 'ProfileStates.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  UpdatePasswordUseCase updatePasswordUseCase;

  TextEditingController passwordNewController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();

  @factoryMethod
  ProfileViewModel(this.updatePasswordUseCase)
      : super(UpdatePasswordInitialState());

  static ProfileViewModel get(context) {
    return BlocProvider.of<ProfileViewModel>(context);
  }

  updatePassword() async {
    if (formKey.currentState!.validate()) {
      emit(UpdatePasswordLoadingState(loadingMessage: "Updating Password"));
      var either = await updatePasswordUseCase.invoke(
          currentPassword: passwordController.text,
          newPassword: passwordController.text,
          confirmPassword: passwordConfirmationController.text);
      either.fold((error) {
        emit(UpdatePasswordErrorState(errorMessage: error));
      }, (response) {
        emit(UpdatePasswordSuccessState(user: response));
      });
    }
  }
}
