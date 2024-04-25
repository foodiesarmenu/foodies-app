import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/OnlineOrder.dart';

import '../../domain/model/CashOrder.dart';
import '../../domain/model/DeliveryAddress.dart';

abstract class OrderDataSource {
  Future<Either<Failures, OnlineOrder>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, CashOrder>> createCashOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, OnlineOrder>> updateOrder();

  Future<Either<Failures, OnlineOrder>> deleteOrder();

  Future<Either<Failures, OnlineOrder>> getOrder();

  Future<Either<Failures, OnlineOrder>> getOrders();
}
