import '../../../../../../../domain/model/DeliveryAddress.dart';

abstract class FormAddressStates {}

class DeliveryAddressInitialState extends FormAddressStates {}

class AddAddressSuccessState extends FormAddressStates {
  DeliveryAddress? deliveryAddress;

  AddAddressSuccessState({this.deliveryAddress});
}

class AddAddressErrorState extends FormAddressStates {
  String? error;

  AddAddressErrorState({this.error});
}
