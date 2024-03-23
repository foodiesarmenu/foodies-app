import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodies_app/ui/auth/register/cubit/register_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecase/register_use_case.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  @factoryMethod
  RegisterViewModel(this.registerUseCase) : super(RegisterInitialState());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMessage: 'loading...'));

      var either = await registerUseCase.invoke(nameController.text,
          emailController.text, passwordController.text, phoneController.text);
      either.fold((error) {
        emit(RegisterErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(authResult: response));
      });
    }
  }
}
