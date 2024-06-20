import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/User.dart';
import '../../../domain/usecase/get_order_use_case.dart';
import '../../../domain/usecase/get_profile_data_use_case.dart';
import 'orders_details_states.dart';

@injectable
class OrderDetailsViewModel extends Cubit<OrderDetailsStates> {
  GetOrderUseCase getOrderUseCase;
  GetProfileDataUseCase getProfileDataUseCase;

  @factoryMethod
  OrderDetailsViewModel(this.getOrderUseCase, this.getProfileDataUseCase)
      : super(InitialState());

  User? user;
  getOrder({required String orderId}) async {
    emit(GetOrderLoadingState(loadingMessage: "Loading Orders..."));
    var either = await getOrderUseCase.invoke(orderId: orderId);
    var userData = await getProfileDataUseCase.invoke();
    userData.fold(
      (l) {
        emit(GetUserDataErrorState(error: l.errorMessage));
      },
      (r) {
        user = r;
      },
    );
    either.fold((error) {
      emit(GetOrderErrorState(errorMessage: error));
    }, (response) {
      print('Response: $response');
      emit(GetOrderSuccessState(orderResponse: response));
    });
  }
}
