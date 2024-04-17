import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';

import '../../domain/model/Cart.dart';

abstract class CartDataSource {
  Future<Either<Failures, Cart>> getCart();

  Future<Either<Failures, Cart>> removeItemFromCart({required String mealId});

  Future<Either<Failures, Cart>> updateCountInCart(
      {required String mealId, required int quantity});

  Future<Either<Failures, Cart>> addToCart(
      {required String mealId, required String restaurantId});

  Future<Either<Failures, Cart?>> deleteCart();
}
