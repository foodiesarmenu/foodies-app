import '../../../domain/failures.dart';
import '../../../domain/model/DeliveryAddress.dart';
import '../../../domain/model/OrderEntity.dart';
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
  OrderEntity onlineOrderPayment;

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
  OrderEntity cashOrder;

  CreateCashOrderSuccessState({required this.cashOrder});
}

class MakePaymentLoadingState extends CheckoutStates {}

class MakePaymentErrorState extends CheckoutStates {
  Failures errorMessage;

  MakePaymentErrorState({required this.errorMessage});
}

class MakePaymentSuccessState extends CheckoutStates {}

class GetPrimaryDeliveryAddressSuccessState extends CheckoutStates {
  DeliveryAddress? primaryDeliveryAddress;

  GetPrimaryDeliveryAddressSuccessState({this.primaryDeliveryAddress});
}

class GetPrimaryDeliveryAddressErrorState extends CheckoutStates {
  String? error;

  GetPrimaryDeliveryAddressErrorState({this.error});
}