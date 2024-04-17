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
