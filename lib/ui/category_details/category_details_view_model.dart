import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Restaurant.dart';
import '../../domain/usecase/GetRestaurantsByCategoryId.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  GetRestaurantsByCategoryId getRestaurantsByCategoryId;

  @factoryMethod
  CategoryDetailsViewModel(this.getRestaurantsByCategoryId)
      : super(LoadingState('Loading...'));

  initPage({String? categoryId}) async {
    emit(LoadingState('Loading.....'));
    try {
      var restaurants = await getRestaurantsByCategoryId.invoke(categoryId);
      emit(SuccessState(restaurants));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class LoadingState extends CategoryDetailsState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends CategoryDetailsState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends CategoryDetailsState {
  List<Restaurant>? restaurants;

  SuccessState(this.restaurants);
}
