import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/Category.dart';
import '../../../../domain/model/Restaurant.dart';
import '../../../../domain/usecase/GetCategoriesUsecase.dart';
import '../../../../domain/usecase/GetRestaurantsUsecase.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  GetRestaurantsUsecase getRestaurantsUsecase;
  GetCategoriesUsecase getCategoriesUsecase;

  @factoryMethod
  HomeTabViewModel(this.getRestaurantsUsecase, this.getCategoriesUsecase)
      : super(LoadingState('Loading...'));

  initPage() async {
    emit(LoadingState('Loading.....'));
    try {
      var restaurants = await getRestaurantsUsecase.invoke();
      var categories = await getCategoriesUsecase.invoke();
      emit(SuccessState(restaurants, categories));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class HomeTabState {}

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

  SuccessState(this.restaurants, this.categories);
}
