import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/OrderEntity.dart';
import '../../../../domain/usecase/get_all_orders_use_case.dart';
import 'orders_tab_states.dart';

@injectable
class OrdersTabViewModel extends Cubit<OrdersTabStates> {
  GetAllOrdersUseCase getAllOrdersUseCase;

  @factoryMethod
  OrdersTabViewModel(this.getAllOrdersUseCase)
      : super(InitialState());

  getAllOrders() async {
    emit(GetAllOrdersLoadingState(loadingMessage: "Loading Orders..."));
    var either = await getAllOrdersUseCase.invoke();
    either.fold((error) {
      emit(GetAllOrdersErrorState(errorMessage: error));
    }, (response) {
      List<OrderEntity> sortedOrders = response;
      sortedOrders.sort((a, b) => b.date!.compareTo(a.date ?? ''));

      emit(GetAllOrdersSuccessState(ordersResponse: sortedOrders));
    });
  }

}
