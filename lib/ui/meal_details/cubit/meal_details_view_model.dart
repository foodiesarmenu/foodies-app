import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/ui/utils/shared_preference_utils.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/add_to_cart_use_case.dart';
import 'meal_details_states.dart';

@injectable
class MealDetailsViewModel extends Cubit<MealDetailsStates> {
  AddToCartUseCase addToCartUseCase;

  @factoryMethod
  MealDetailsViewModel(this.addToCartUseCase) : super(AddToCartInitialState());
  addToCart({required String mealId, required String restaurantId,required int quantity, required String size}) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading....'));
    var either = await addToCartUseCase.invoke(
        mealId: mealId, restaurantId: restaurantId, quantity: quantity, size: size);
    either.fold((error) {
      print(error.errorMessage);
      emit(AddToCartErrorState(errorMessage: error));
    }, (response) {
      emit(AddToCartSuccessState(cart: response));
      SharedPreferenceUtils.saveData(
          key: 'numOfCartItems', value: response.noOfOrderItems);
    });
  }
}
