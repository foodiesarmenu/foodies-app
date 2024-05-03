import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecase/get_order_use_case.dart';
import 'orders_details_states.dart';

@injectable
class OrderDetailsViewModel extends Cubit<OrderDetailsStates> {
  GetOrderUseCase getOrderUseCase;

  @factoryMethod
  OrderDetailsViewModel(this.getOrderUseCase)
      : super(InitialState());

  getOrder({required String orderId}) async {
    emit(GetOrderLoadingState(loadingMessage: "Loading Orders..."));
    var either = await getOrderUseCase.invoke(orderId: orderId);
    either.fold((error) {
      print(error.errorMessage);
      emit(GetOrderErrorState(errorMessage: error));

    }, (response) {
      print('Response: $response');
      emit(GetOrderSuccessState(orderResponse: response));
    });
  }

}
