import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/GetMenusUsecase.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Menu.dart';

@injectable
class MenuViewModel extends Cubit<MenuState> {
  GetMenusUsecase getMenusUsecase;

  @factoryMethod
  MenuViewModel(this.getMenusUsecase) : super(Loading('Loading...'));

  initPage({String? restaurantId}) async {
    try {
      var menus = await getMenusUsecase.invoke(restaurantId);
      emit(Success(menus));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

sealed class MenuState {}

class Loading extends MenuState {
  String? message;

  Loading(this.message);
}

class Error extends MenuState {
  String? errorMessage;

  Error(this.errorMessage);
}

class Success extends MenuState {
  List<Menu>? menus;

  Success(this.menus);
}
