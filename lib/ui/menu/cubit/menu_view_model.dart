import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/get_menus_use_case.dart';
import 'package:foodies_app/domain/usecase/get_restaurant_by_id_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/Menu.dart';
import '../../../domain/usecase/add_to_favourite_use_case.dart';
import '../../../domain/usecase/check_favourite_use_case.dart';
import 'menu_states.dart';

@injectable
class MenuViewModel extends Cubit<MenuStates> {
  GetMenusUsecase getMenusUsecase;
  AddToFavouriteUseCase addToFavouriteUseCase;
  CheckFavouriteUseCase checkFavouriteUseCase;
  GetRestaurantByIdUseCase getRestaurantByIdUseCase;

  @factoryMethod
  MenuViewModel(this.getMenusUsecase, this.addToFavouriteUseCase,
      this.checkFavouriteUseCase, this.getRestaurantByIdUseCase)
      : super(Initial());

  bool isFavourite = false;

  static MenuViewModel get(context) => BlocProvider.of<MenuViewModel>(context);
  var menus = <Menu>[];
  var restaurant;
  initPage({String? restaurantId}) async {
    try {
      Loading('Loading...');
      menus = await getMenusUsecase.invoke(restaurantId) ?? [];
      var checkFavourite =
          await checkFavouriteUseCase.invoke(restaurantId: restaurantId!);
      restaurant =
          await getRestaurantByIdUseCase.invoke(restaurantId: restaurantId);
      checkFavourite.fold((error) {
        emit(CheckFavouriteErrorState(errorMessage: error));
      }, (response) {
        isFavourite = response.success!;
        emit(CheckFavouriteSuccessState(favourite: response));
      });
      // restaurant.fold((error) {
      //   emit(GetRestaurantByIdErrorState(errorMessage: error));
      // }, (response) {
      //   emit(GetRestaurantByIdSuccessState(restaurant: response));
      // });
      emit(Success(
          menus, restaurant.fold((error) => null, (response) => response)));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  addToFavourite({required String restaurantId}) async {
    var addToFavourite =
        await addToFavouriteUseCase.invoke(restaurantId: restaurantId);

    addToFavourite.fold((error) {
      emit(AddToFavouriteErrorState(errorMessage: error));
    }, (response) {
      isFavourite = !isFavourite;
      emit(Success(
          menus, restaurant.fold((error) => null, (response) => response)));
    });
  }

  checkFavourite({required String restaurantId}) async {
    emit(CheckFavouriteLoadingState(loadingMessage: 'Adding to favourite...'));
    var either = await checkFavouriteUseCase.invoke(restaurantId: restaurantId);
    either.fold((error) {
      emit(CheckFavouriteErrorState(errorMessage: error));
    }, (response) {
      isFavourite = true;
      emit(CheckFavouriteSuccessState(favourite: response));
    });
  }
}
