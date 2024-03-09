import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api_manager/api_manager.dart';
import '../../../model/data.dart';

class RestaurantListViewModel extends Cubit<RestaurantListState> {
  RestaurantListViewModel() : super(LoadingState('Loading...'));

  Future<void> getRestaurants() async {
    emit(LoadingState('Loading.....'));
    try {
      var response = await ApiManager.getRestaurants();
      if (response.message == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.data!));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class RestaurantListState {}

class SuccessState extends RestaurantListState {
  List<Data> restaurantList;

  SuccessState(this.restaurantList);
}

class LoadingState extends RestaurantListState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends RestaurantListState {
  String errorMessage;

  ErrorState(this.errorMessage);
}
