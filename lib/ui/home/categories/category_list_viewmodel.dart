import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api_manager/api_manager.dart';
import '../../../model/data.dart';

class CategoryListViewModel extends Cubit<CategoryListState> {
  CategoryListViewModel() : super(LoadingState('Loading...'));

  Future<void> getCategories() async {
    emit(LoadingState('Loading.....'));
    try {
      var response = await ApiManager.getCategories();
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

sealed class CategoryListState {}

class SuccessState extends CategoryListState {
  List<Data> categoryList;

  SuccessState(this.categoryList);
}

class LoadingState extends CategoryListState {
  String message;

  LoadingState(this.message);
}

class ErrorState extends CategoryListState {
  String errorMessage;

  ErrorState(this.errorMessage);
}
