import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/Cart.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class RemoveItemFromCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  RemoveItemFromCartUseCase(this.cartRepository);

  Future<Either<Failures, Cart>> invoke({required String mealId}) async {
    return await cartRepository.removeItemFromCart(mealId: mealId);
  }
}
