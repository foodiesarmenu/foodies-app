import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecase/get_profile_data_use_case.dart';
import 'edit_profile_states.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileStates> {
  GetProfileDataUseCase getProfileDataUseCase;

  @factoryMethod
  EditProfileViewModel(this.getProfileDataUseCase)
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
}
