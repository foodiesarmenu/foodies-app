import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/CheckFavourite.dart';
import 'package:foodies_app/domain/model/Favourite.dart';

import '../../../domain/model/Menu.dart';
import '../../../domain/model/Restaurant.dart';

abstract class MenuStates {}

class Initial extends MenuStates {}

class Loading extends MenuStates {
  String? message;

  Loading(this.message);
}

class Error extends MenuStates {
  String? errorMessage;

  Error(this.errorMessage);
}

class Success extends MenuStates {
  List<Menu>? menus;
  Restaurant? restaurant;

  Success(this.menus, this.restaurant);
}

class AddToFavouriteLoadingState extends MenuStates {
  String? loadingMessage;

  AddToFavouriteLoadingState({required this.loadingMessage});
}

class AddToFavouriteErrorState extends MenuStates {
  Failures errorMessage;

  AddToFavouriteErrorState({required this.errorMessage});
}

class AddToFavouriteSuccessState extends MenuStates {
  Favourite? favourite;

  AddToFavouriteSuccessState({required this.favourite});
}

class CheckFavouriteLoadingState extends MenuStates {
  String? loadingMessage;

  CheckFavouriteLoadingState({required this.loadingMessage});
}

class CheckFavouriteErrorState extends MenuStates {
  Failures errorMessage;

  CheckFavouriteErrorState({required this.errorMessage});
}

class CheckFavouriteSuccessState extends MenuStates {
  CheckFavourite? favourite;

  CheckFavouriteSuccessState({required this.favourite});
}

class GetRestaurantByIdErrorState extends MenuStates {
  Failures errorMessage;

  GetRestaurantByIdErrorState({required this.errorMessage});
}

class GetRestaurantByIdSuccessState extends MenuStates {
  Restaurant? restaurant;

  GetRestaurantByIdSuccessState({this.restaurant});
}
