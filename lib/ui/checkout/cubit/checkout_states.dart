import '../../../domain/failures.dart';
import '../../../domain/model/CashOrder.dart';
import '../../../domain/model/OnlineOrder.dart';

abstract class CheckoutStates {}

class MakePaymentInitialState extends CheckoutStates {}

class CreateOnlineOrderLoadingState extends CheckoutStates {
  String? loadingMessage;

  CreateOnlineOrderLoadingState({required this.loadingMessage});
}

class CreateOnlineOrderErrorState extends CheckoutStates {
  Failures errorMessage;

  CreateOnlineOrderErrorState({required this.errorMessage});
}

class CreateOnlineOrderSuccessState extends CheckoutStates {
  OnlineOrder onlineOrderPayment;

  CreateOnlineOrderSuccessState({required this.onlineOrderPayment});
}

class CreateCashOrderLoadingState extends CheckoutStates {
  String? loadingMessage;

  CreateCashOrderLoadingState({required this.loadingMessage});
}

class CreateCashOrderErrorState extends CheckoutStates {
  Failures errorMessage;

  CreateCashOrderErrorState({required this.errorMessage});
}

class CreateCashOrderSuccessState extends CheckoutStates {
  CashOrder cashOrder;

  CreateCashOrderSuccessState({required this.cashOrder});
}

class MakePaymentLoadingState extends CheckoutStates {}

class MakePaymentErrorState extends CheckoutStates {
  Failures errorMessage;

  MakePaymentErrorState({required this.errorMessage});
}

class MakePaymentSuccessState extends CheckoutStates {}
