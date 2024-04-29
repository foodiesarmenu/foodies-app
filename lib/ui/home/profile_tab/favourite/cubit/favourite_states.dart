import '../../../../../domain/failures.dart';
import '../../../../../domain/model/Favourite.dart';

abstract class FavouriteStates {}

class InitialState extends FavouriteStates {}

class GetAllFavouriteLoadingState extends FavouriteStates {
  String? loadingMessage;

  GetAllFavouriteLoadingState({required this.loadingMessage});
}

class GetAllFavouriteErrorState extends FavouriteStates {
  Failures errorMessage;

  GetAllFavouriteErrorState({required this.errorMessage});
}

class GetAllFavouriteSuccessState extends FavouriteStates {
  List<Favourite> favouriteResponse;

  GetAllFavouriteSuccessState({required this.favouriteResponse});
}

class DeleteFavouriteErrorState extends FavouriteStates {
  Failures errorMessage;

  DeleteFavouriteErrorState({required this.errorMessage});
}

class DeleteFavouriteSuccessState extends FavouriteStates {
  Favourite favouriteResponse;

  DeleteFavouriteSuccessState({required this.favouriteResponse});
}
