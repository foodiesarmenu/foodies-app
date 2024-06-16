import 'package:foodies_app/domain/model/OrderEntity.dart';

import '../../../../../domain/failures.dart';

abstract class OrdersTabStates {}

class InitialState extends OrdersTabStates {}

class GetAllOrdersLoadingState extends OrdersTabStates {
  String loadingMessage;

  GetAllOrdersLoadingState({required this.loadingMessage});
}

class GetAllOrdersErrorState extends OrdersTabStates {
  Failures errorMessage;

  GetAllOrdersErrorState({required this.errorMessage});
}

class GetAllOrdersSuccessState extends OrdersTabStates {
  List<OrderEntity> ordersResponse;

  GetAllOrdersSuccessState({required this.ordersResponse});
}


class ReOrderErrorState extends OrdersTabStates {
  Failures errorMessage;

  ReOrderErrorState({required this.errorMessage});
}

class ReOrderSuccessState extends OrdersTabStates {
  OrderEntity orderResponse;

  ReOrderSuccessState({required this.orderResponse});
}

class DeleteCartErrorState extends OrdersTabStates {
  Failures errorMessage;

  DeleteCartErrorState({required this.errorMessage});
}

class DeleteCartSuccessState extends OrdersTabStates {
  OrderEntity? orderResponse;

  DeleteCartSuccessState({required this.orderResponse});
}
