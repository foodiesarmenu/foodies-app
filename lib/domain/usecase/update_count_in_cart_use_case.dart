import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/OrderEntity.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  UpdateCountInCartUseCase(this.cartRepository);

  Future<Either<Failures, OrderEntity>> invoke(
      {required String mealId, required int quantity,required String sizeId}) async {
    return await cartRepository.updateCountInCart(
        mealId: mealId, quantity: quantity, sizeId: sizeId);
  }
}
