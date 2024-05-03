import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/OrderEntity.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class AddToCartUseCase {
  CartRepository cartRepository;

  @factoryMethod
  AddToCartUseCase(this.cartRepository);

  Future<Either<Failures, OrderEntity>> invoke(
      {required String mealId, required String restaurantId,required int quantity, required String sizeId}) async {
    return await cartRepository.addToCart(
        mealId: mealId, restaurantId: restaurantId, quantity: quantity, sizeId: sizeId);
  }
}
