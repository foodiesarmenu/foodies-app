import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/OnlineOrder.dart';

import '../../domain/model/OrderEntity.dart';
import '../../domain/model/DeliveryAddress.dart';
import '../../domain/model/OrderEntity.dart';

abstract class OrderDataSource {
  Future<Either<Failures, OnlineOrder>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, OrderEntity>> createCashOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, OnlineOrder>> updateOrder();

  Future<Either<Failures, OnlineOrder>> deleteOrder();

  Future<Either<Failures, OrderEntity>> getOrder({required String orderId});

  Future<Either<Failures, List<OrderEntity>>> getAllOrders();
}
