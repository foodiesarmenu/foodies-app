import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/OrderEntity.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  GetCartUseCase(this.cartRepository);

  Future<Either<Failures, OrderEntity>> invoke() async {
    return await cartRepository.getCart();
  }
}
