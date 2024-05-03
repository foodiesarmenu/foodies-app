import '../../../domain/failures.dart';
import '../../../domain/model/OrderEntity.dart';

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
  OrderEntity cart;

  AddToCartSuccessState({required this.cart});
}
