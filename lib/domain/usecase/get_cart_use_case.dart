import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/Cart.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  GetCartUseCase(this.cartRepository);

  Future<Either<Failures, Cart>> invoke() async {
    return await cartRepository.getCart();
  }
}
