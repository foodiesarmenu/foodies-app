import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/Cart.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  UpdateCountInCartUseCase(this.cartRepository);

  Future<Either<Failures, Cart>> invoke(
      {required String mealId, required int quantity}) async {
    return await cartRepository.updateCountInCart(
        mealId: mealId, quantity: quantity);
  }
}
