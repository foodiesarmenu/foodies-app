import '../../../domain/failures.dart';
import '../../../domain/model/OrderEntity.dart';

abstract class CartScreenStates {}

class GetCartInitialState extends CartScreenStates {}

class GetCartLoadingState extends CartScreenStates {
  String? loadingMessage;

  GetCartLoadingState({required this.loadingMessage});
}

class GetCartErrorState extends CartScreenStates {
  Failures errorMessage;

  GetCartErrorState({required this.errorMessage});
}

class GetCartSuccessState extends CartScreenStates {
  OrderEntity? cart;

  GetCartSuccessState({required this.cart});
}

class UpdateCountInCartInitialState extends CartScreenStates {}

class UpdateCountInCartLoadingState extends CartScreenStates {
  String? loadingMessage;

  UpdateCountInCartLoadingState({required this.loadingMessage});
}

class UpdateCountInCartErrorState extends CartScreenStates {
  Failures errorMessage;

  UpdateCountInCartErrorState({required this.errorMessage});
}

class UpdateCountInCartSuccessState extends CartScreenStates {
  OrderEntity cart;

  UpdateCountInCartSuccessState({required this.cart});
}

class RemoveItemFromCartInitialState extends CartScreenStates {}

class RemoveItemFromCartLoadingState extends CartScreenStates {
  String? loadingMessage;

  RemoveItemFromCartLoadingState({required this.loadingMessage});
}

class RemoveItemFromCartErrorState extends CartScreenStates {
  Failures errorMessage;

  RemoveItemFromCartErrorState({required this.errorMessage});
}

class RemoveItemFromCartSuccessState extends CartScreenStates {
  OrderEntity cart;

  RemoveItemFromCartSuccessState({required this.cart});
}

class DeleteCartInitialState extends CartScreenStates {}

class DeleteCartLoadingState extends CartScreenStates {
  String? loadingMessage;

  DeleteCartLoadingState({required this.loadingMessage});
}

class DeleteCartErrorState extends CartScreenStates {
  Failures errorMessage;

  DeleteCartErrorState({required this.errorMessage});
}

class DeleteCartSuccessState extends CartScreenStates {
  OrderEntity? cart;

  DeleteCartSuccessState({required this.cart});
}

class ApplyCouponErrorState extends CartScreenStates {
  String? errorMessage;

  ApplyCouponErrorState({required this.errorMessage});
}

class ApplyCouponSuccessState extends CartScreenStates {
  OrderEntity? cart;

  ApplyCouponSuccessState({required this.cart});
}
