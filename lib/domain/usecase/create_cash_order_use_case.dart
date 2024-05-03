import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/OrderEntity.dart';
import '../model/DeliveryAddress.dart';
import '../repositoryContract/order_repository.dart';

@injectable
class CreateCashOrderUseCase {
  OrderRepository orderRepository;

  @factoryMethod
  CreateCashOrderUseCase(this.orderRepository);

  Future<Either<Failures, OrderEntity>> invoke(
      {required DeliveryAddress deliveryAddress}) async {
    return await orderRepository.createCashOrder(
        deliveryAddress: deliveryAddress);
  }
}
