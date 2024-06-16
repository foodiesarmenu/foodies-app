import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/domain/usecase/delete_cart_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/OrderEntity.dart';
import '../../../../domain/usecase/get_all_orders_use_case.dart';
import '../../../../domain/usecase/re_order_use_case.dart';
import '../../../utils/shared_preference_utils.dart';
import 'orders_tab_states.dart';

@injectable
class OrdersTabViewModel extends Cubit<OrdersTabStates> {
  GetAllOrdersUseCase getAllOrdersUseCase;
  ReOrderUseCase reOrderUseCase;
  DeleteCartUseCase deleteCartUseCase;

  @factoryMethod
  OrdersTabViewModel(
      this.getAllOrdersUseCase, this.reOrderUseCase, this.deleteCartUseCase)
      : super(InitialState());

  static OrdersTabViewModel of(context) => BlocProvider.of(context);

  deleteCart() async {
    var either = await deleteCartUseCase.invoke();
    either.fold((error) {
      emit(DeleteCartErrorState(errorMessage: error));
    }, (response) {
      SharedPreferenceUtils.removeData(key: 'numOfCartItems');
    });
  }

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

  reOrder({required String orderId}) async {
    var either = await reOrderUseCase.invoke(orderId: orderId);
    either.fold((error) {
      emit(ReOrderErrorState(errorMessage: error));
      print(error.errorMessage);
    }, (response) async {
      emit(ReOrderSuccessState(orderResponse: response));
      SharedPreferenceUtils.saveData(
          key: 'numOfCartItems', value: response.noOfOrderItems?.toInt());
    });
  }
}
