import '../../../domain/failures.dart';
import '../../../domain/model/Cart.dart';

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
  Cart cart;

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
  Cart cart;

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
  Cart cart;

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
  Cart? cart;

  DeleteCartSuccessState({required this.cart});
}
