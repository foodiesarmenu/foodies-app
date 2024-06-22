import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodies_app/domain/usecase/change_password_use_case.dart';
import 'package:injectable/injectable.dart';

import 'change_password_states.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordStates> {
  ChangePasswordUseCase changePasswordUseCase;

  @factoryMethod
  ChangePasswordViewModel(this.changePasswordUseCase)
      : super(ChangePasswordInitialState());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  Future<void> changePassword({required String email}) async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState(loadingMessage: 'loading...'));

      var either = await changePasswordUseCase.invoke(
          email: email,
          newPassword: newPasswordController.text,
          confirmPassword: confirmPasswordController.text);
      either.fold((error) {
        print(error.errorMessage);
        emit(ChangePasswordErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(ChangePasswordSuccessState(authResult: response));
      });
    }
  }
}
