import '../../../domain/failures.dart';
import '../../../domain/model/Cart.dart';

abstract class MealDetailsStates {}

class AddToCartInitialState extends MealDetailsStates {}

class AddToCartLoadingState extends MealDetailsStates {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends MealDetailsStates {
  Failures errorMessage;

  AddToCartErrorState({required this.errorMessage});
}

class AddToCartSuccessState extends MealDetailsStates {
  Cart cart;

  AddToCartSuccessState({required this.cart});
}
