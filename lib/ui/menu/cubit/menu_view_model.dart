import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/GetMenusUsecase.dart';
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

  @factoryMethod
  MenuViewModel(this.getMenusUsecase, this.addToFavouriteUseCase,
      this.checkFavouriteUseCase)
      : super(Initial());

  bool isFavourite = false;

  static MenuViewModel get(context) => BlocProvider.of<MenuViewModel>(context);
  var menus = <Menu>[];

  initPage({String? restaurantId}) async {
    try {
      Loading('Loading...');
      menus = await getMenusUsecase.invoke(restaurantId) ?? [];
      var checkFavourite =
          await checkFavouriteUseCase.invoke(restaurantId: restaurantId!);
      checkFavourite.fold((error) {
        emit(CheckFavouriteErrorState(errorMessage: error));
      }, (response) {
        isFavourite = response.success!;
        emit(CheckFavouriteSuccessState(favourite: response));
      });
      emit(Success(menus));
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
      emit(Success(menus));
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
