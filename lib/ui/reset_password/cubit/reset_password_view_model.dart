import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/usecase/update_password_use_case.dart';
import 'reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  UpdatePasswordUseCase updatePasswordUseCase;
  TextEditingController passwordNewController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  @factoryMethod
  ResetPasswordViewModel(this.updatePasswordUseCase)
      : super(ResetPasswordInitialState());

  updatePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState(loadingMessage: "Updating Password..."));
      var either = await updatePasswordUseCase.invoke(
          currentPassword: passwordController.text,
          newPassword: passwordNewController.text,
          confirmPassword: passwordConfirmationController.text);
      either.fold((error) {
        emit(ResetPasswordErrorState(
            errorMessage: error.errorMessage ?? 'Error'));
      }, (response) {
        emit(ResetPasswordSuccessState(user: response));
      });
    }
  }
}
