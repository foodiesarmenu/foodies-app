import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecase/login_use_case.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  @factoryMethod
  LoginViewModel(this.loginUseCase) : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState(loadingMessage: 'loading...'));

      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold((error) {
        emit(LoginErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(LoginSuccessState(authResult: response));
      });
    }
  }
}
