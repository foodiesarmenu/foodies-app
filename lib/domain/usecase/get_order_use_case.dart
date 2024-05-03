import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/OrderEntity.dart';
import 'package:foodies_app/domain/repositoryContract/order_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/CheckFavourite.dart';
import '../repositoryContract/favourite_repository.dart';

@injectable
class GetOrderUseCase {
  OrderRepository orderRepository;

  @factoryMethod
  GetOrderUseCase(this.orderRepository);

  Future<Either<Failures, OrderEntity>> invoke({required String orderId}) async {
    return await orderRepository.getOrder(orderId: orderId);
  }
}
