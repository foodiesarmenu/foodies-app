import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/model/response/payment_intent_model_response/PaymentIntentModel.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';

import '../../data/model/request/payment_intent_input_model.dart';
import '../model/CashOrder.dart';
import '../model/OnlineOrder.dart';

abstract class OrderRepository {
  Future<Either<Failures, OnlineOrder>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, CashOrder>> createCashOrder(
      {required DeliveryAddress deliveryAddress});

  Future<Either<Failures, PaymentIntentModel>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});

  Future<Either<Failures, OnlineOrder>> updateOrder();

  Future<Either<Failures, OnlineOrder>> deleteOrder();

  Future<Either<Failures, OnlineOrder>> getOrder();

  Future<Either<Failures, OnlineOrder>> getOrders();
}
