import '../../../domain/model/DeliveryAddress.dart';

abstract class ChangeAddressStates {}

class DeliveryAddressInitialState extends ChangeAddressStates {}

class GetAllAddressesSuccessState extends ChangeAddressStates {
  List<DeliveryAddress>? allDeliveryAddress;

  GetAllAddressesSuccessState({this.allDeliveryAddress});
}

class GetAllAddressesErrorState extends ChangeAddressStates {
  String? error;

  GetAllAddressesErrorState({this.error});
}

class DeleteAddressSuccessState extends ChangeAddressStates {
}
class DeleteAddressErrorState extends ChangeAddressStates {
  String? error;

  DeleteAddressErrorState({this.error});
}

class SetPrimaryAddressSuccessState extends ChangeAddressStates {
}
class SetPrimaryAddressErrorState extends ChangeAddressStates {
  String? error;

  SetPrimaryAddressErrorState({this.error});
}