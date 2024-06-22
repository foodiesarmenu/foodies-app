import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/OrderEntity.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/DeliveryAddress.dart';
import '../model/OnlineOrder.dart';
import '../repositoryContract/order_repository.dart';

@injectable
class CreateOnlineOrderUseCase {
  OrderRepository orderRepository;

  @factoryMethod
  CreateOnlineOrderUseCase(this.orderRepository);

  Future<Either<Failures, OrderEntity>> invoke(
      {required DeliveryAddress deliveryAddress}) async {
    return await orderRepository.createOnlineOrder(
        deliveryAddress: deliveryAddress);
  }
}
