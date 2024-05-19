import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/request/PaymentIntentInputModel.dart';
import '../../data/model/response/payment_intent_model_response/PaymentIntentModel.dart';
import '../failures.dart';
import '../repositoryContract/order_repository.dart';

@injectable
class MakePaymentUseCase {
  OrderRepository orderRepository;

  @factoryMethod
  MakePaymentUseCase(this.orderRepository);

  Future<Either<Failures, PaymentIntentModel>> invoke(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    return orderRepository.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
  }
}
