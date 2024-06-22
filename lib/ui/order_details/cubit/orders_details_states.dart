import 'package:foodies_app/domain/model/OrderEntity.dart';

import '../../../../../domain/failures.dart';
import '../../../domain/model/User.dart';

abstract class OrderDetailsStates {}

class InitialState extends OrderDetailsStates {}

class GetOrderLoadingState extends OrderDetailsStates {
  String? loadingMessage;

  GetOrderLoadingState({required this.loadingMessage});
}

class GetOrderErrorState extends OrderDetailsStates {
  Failures errorMessage;

  GetOrderErrorState({required this.errorMessage});
}

class GetOrderSuccessState extends OrderDetailsStates {
  OrderEntity? orderResponse;

  GetOrderSuccessState({required this.orderResponse});
}

class GetUserDataSuccessState extends OrderDetailsStates {
  User? user;

  GetUserDataSuccessState({this.user});
}

class GetUserDataErrorState extends OrderDetailsStates {
  String? error;

  GetUserDataErrorState({this.error});
}
