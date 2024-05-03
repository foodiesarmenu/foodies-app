import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/OrderEntity.dart';
import 'package:foodies_app/domain/repositoryContract/order_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/CheckFavourite.dart';
import '../repositoryContract/favourite_repository.dart';

@injectable
class GetAllOrdersUseCase {
  OrderRepository orderRepository;

  @factoryMethod
  GetAllOrdersUseCase(this.orderRepository);

  Future<Either<Failures, List<OrderEntity>>> invoke() async {
    return await orderRepository.getAllOrders();
  }
}
