import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/GetMenusUsecase.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/add_to_favourite_use_case.dart';
import 'menu_states.dart';

@injectable
class MenuViewModel extends Cubit<MenuStates> {
  GetMenusUsecase getMenusUsecase;
  AddToFavouriteUseCase addToFavouriteUseCase;

  @factoryMethod
  MenuViewModel(this.getMenusUsecase, this.addToFavouriteUseCase)
      : super(Initial());

  static MenuViewModel get(context) => BlocProvider.of<MenuViewModel>(context);

  initPage({String? restaurantId}) async {
    try {
      Loading('Loading...');
      var menus = await getMenusUsecase.invoke(restaurantId);
      emit(Success(menus));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  addToFavourite({required String restaurantId}) async {
    emit(AddToFavouriteLoadingState(loadingMessage: 'Adding to favourite...'));
    var either = await addToFavouriteUseCase.invoke(restaurantId: restaurantId);
    var menus = await getMenusUsecase.invoke(restaurantId);

    either.fold((error) {
      emit(AddToFavouriteErrorState(errorMessage: error));
    }, (response) {
      emit(Success(menus));
    });
  }
}
