import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';

import '../../../domain/model/Menu.dart';

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

  Success(this.menus);
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
