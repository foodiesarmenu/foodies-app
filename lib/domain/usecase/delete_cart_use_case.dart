import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/Cart.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class DeleteCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  DeleteCartUseCase(this.cartRepository);

  Future<Either<Failures, Cart?>> invoke() async {
    return await cartRepository.deleteCart();
  }
}
