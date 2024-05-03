import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:foodies_app/domain/model/OnlineOrder.dart';
import 'package:injectable/injectable.dart';
import '../../domain/model/OrderEntity.dart';
import '../../domain/repositoryContract/order_repository.dart';
import '../../ui/utils/stripe_service.dart';
import '../dataSourceContract/order_data_source.dart';
import '../model/request/payment_intent_input_model.dart';
import '../model/response/payment_intent_model_response/PaymentIntentModel.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl extends OrderRepository {
  OrderDataSource onlineOrderDataSource;
  StripeService stripeService;

  @factoryMethod
  OrderRepositoryImpl(this.onlineOrderDataSource, this.stripeService);

  @override
  Future<Either<Failures, OrderEntity>> createCashOrder(
      {required DeliveryAddress deliveryAddress}) {
    return onlineOrderDataSource.createCashOrder(
        deliveryAddress: deliveryAddress);
  }

  @override
  Future<Either<Failures, OnlineOrder>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress}) {
    return onlineOrderDataSource.createOnlineOrder(
        deliveryAddress: deliveryAddress);
  }

  @override
  Future<Either<Failures, PaymentIntentModel>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(PaymentIntentModel());
    } on StripeException catch (e) {
      print(e.toString());
      return left(
          Failures(errorMessage: e.error.message ?? 'Oops there was an error'));
    } catch (e) {
      print(e.toString());
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, OnlineOrder>> deleteOrder() {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, OrderEntity>> getOrder({required String orderId}) {
    return onlineOrderDataSource.getOrder(
        orderId: orderId);
  }

  @override
  Future<Either<Failures, List<OrderEntity>>> getAllOrders() {
    return onlineOrderDataSource.getAllOrders();
  }

  @override
  Future<Either<Failures, OnlineOrder>> updateOrder() {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }
}
