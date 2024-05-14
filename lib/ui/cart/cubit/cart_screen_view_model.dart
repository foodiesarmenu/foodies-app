import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/delete_cart_use_case.dart';
import '../../../domain/usecase/get_cart_use_case.dart';
import '../../../domain/usecase/remove_item_from_cart_use_case.dart';
import '../../../domain/usecase/update_count_in_cart_use_case.dart';
import '../../utils/shared_preference_utils.dart';
import 'cart_states.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetCartUseCase getCartUseCase;
  RemoveItemFromCartUseCase removeItemFromCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;
  DeleteCartUseCase deleteCartUseCase;

  @factoryMethod
  CartScreenViewModel(
    this.getCartUseCase,
    this.removeItemFromCartUseCase,
    this.updateCountInCartUseCase,
    this.deleteCartUseCase,
  ) : super(GetCartInitialState());

  static CartScreenViewModel get(context) =>
      BlocProvider.of<CartScreenViewModel>(context);

  getCart() async {
    emit(GetCartLoadingState(loadingMessage: 'Loading....'));
    var either = await getCartUseCase.invoke();

    either.fold((error) {
      emit(GetCartErrorState(errorMessage: error));
    }, (response) {
      emit(GetCartSuccessState(cart: response));
    });
  }

  updateCountInCart({required int quantity, required String mealId,required String size}) async {
    var either = await updateCountInCartUseCase.invoke(
        mealId: mealId, quantity: quantity, size: size);

    either.fold((error) {
      emit(UpdateCountInCartErrorState(errorMessage: error));
    }, (response) {
      emit(GetCartSuccessState(cart: response));
      SharedPreferenceUtils.saveData(
          key: 'numOfCartItems', value: response.noOfOrderItems);

    });
  }

  removeItemFromCart({required String mealId}) async {
    var either = await removeItemFromCartUseCase.invoke(mealId: mealId);

    either.fold((error) {
      emit(RemoveItemFromCartErrorState(errorMessage: error));
    }, (response) {
      emit(GetCartSuccessState(cart: response));
      SharedPreferenceUtils.saveData(
          key: 'numOfCartItems', value: response.noOfOrderItems);

    });
  }

  clearCart() async {
    var either = await deleteCartUseCase.invoke();

    either.fold((error) {
      emit(DeleteCartErrorState(errorMessage: error));
    }, (response) {
      emit(DeleteCartSuccessState(cart: response));
      SharedPreferenceUtils.saveData(
          key: 'numOfCartItems', value: response?.noOfOrderItems ?? 0);

    });
  }
}
