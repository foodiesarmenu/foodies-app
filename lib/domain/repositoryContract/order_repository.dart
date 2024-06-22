import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/model/response/payment_intent_model_response/PaymentIntentModel.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';

import '../../data/model/request/PaymentIntentInputModel.dart';
import '../model/OnlineOrder.dart';
import '../model/OrderEntity.dart';

abstract class OrderRepository {
  Future<Either<Failures, OrderEntity>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, OrderEntity>> createCashOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, PaymentIntentModel>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});

  Future<Either<Failures, OnlineOrder>> updateOrder();

  Future<Either<Failures, OnlineOrder>> deleteOrder();

  Future<Either<Failures, OrderEntity>> getOrder({required String orderId});

  Future<Either<Failures, List<OrderEntity>>> getAllOrders();

  Future<Either<Failures, OrderEntity>> reOrder({required String orderId});
}
