import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodies_app/domain/usecase/forget_password_use_case.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  @factoryMethod
  ForgetPasswordViewModel(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitialState());
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  Future<void> forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState(loadingMessage: 'loading...'));

      var either = await forgetPasswordUseCase.invoke(
        email: emailController.text,
      );
      either.fold((error) {
        emit(ForgetPasswordErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(ForgetPasswordSuccessState(forgetPassword: response));
      });
    }
  }
}
