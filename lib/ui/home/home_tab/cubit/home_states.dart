import '../../../../domain/model/Category.dart';
import '../../../../domain/model/DeliveryAddress.dart';
import '../../../../domain/model/Promotion.dart';
import '../../../../domain/model/Restaurant.dart';

abstract class HomeTabState {}

class InitialState extends HomeTabState {}

class LoadingState extends HomeTabState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends HomeTabState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends HomeTabState {
  List<Restaurant>? restaurants;
  List<Category>? categories;
  List<Promotion>? promotions;

  SuccessState({this.restaurants, this.categories, this.promotions});
}

class GetAllPromotionsSuccessState extends HomeTabState {
  List<Promotion>? promotion;

  GetAllPromotionsSuccessState({this.promotion});
}

class GetAllPromotionsErrorState extends HomeTabState {
  String? error;

  GetAllPromotionsErrorState({this.error});
}

class GetPrimaryDeliveryAddressSuccessState extends HomeTabState {
  DeliveryAddress? primaryDeliveryAddress;

  GetPrimaryDeliveryAddressSuccessState({this.primaryDeliveryAddress});
}

class GetPrimaryDeliveryAddressErrorState extends HomeTabState {
  String? error;

  GetPrimaryDeliveryAddressErrorState({this.error});
}

class GetAllDeliveryAddressesSuccessState extends HomeTabState {
  List<DeliveryAddress>? allDeliveryAddresses;

  GetAllDeliveryAddressesSuccessState({this.allDeliveryAddresses});
}

class GetAllDeliveryAddressesErrorState extends HomeTabState {
  String? error;

  GetAllDeliveryAddressesErrorState({this.error});
}

class SetPrimaryAddressSuccessState extends HomeTabState {}

class SetPrimaryAddressErrorState extends HomeTabState {
  String? error;

  SetPrimaryAddressErrorState({this.error});
}
