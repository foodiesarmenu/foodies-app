import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/model/Favourite.dart';
import '../../../../../domain/usecase/add_to_favourite_use_case.dart';
import '../../../../../domain/usecase/get_all_favourites_use_case.dart';
import 'favourite_states.dart';

@injectable
class FavouriteViewModel extends Cubit<FavouriteStates> {
  GetAllFavouritesUseCase getAllFavouritesUseCase;
  AddToFavouriteUseCase DeleteFavouriteUseCase;

  @factoryMethod
  FavouriteViewModel(this.getAllFavouritesUseCase, this.DeleteFavouriteUseCase)
      : super(InitialState());
  List<Favourite> favourites = [];

  int? noOfFavourites;

  getAllFavourites() async {
    var either = await getAllFavouritesUseCase.invoke();
    either.fold((error) {
      emit(GetAllFavouriteErrorState(errorMessage: error));
    }, (response) {
      favourites = response.favourite ?? [];
      emit(GetAllFavouriteSuccessState(favouriteResponse: favourites));
    });
  }

  DeleteFavourite({required String restaurantId}) async {
    var either =
        await DeleteFavouriteUseCase.invoke(restaurantId: restaurantId);
    either.fold((error) {
      emit(DeleteFavouriteErrorState(errorMessage: error));
    }, (response) {
      favourites
          .removeWhere((element) => element.restaurant!.id == restaurantId);
      emit(GetAllFavouriteSuccessState(favouriteResponse: favourites));
    });
  }
}
