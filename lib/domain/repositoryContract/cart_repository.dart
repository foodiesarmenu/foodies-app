import 'package:dartz/dartz.dart';

import '../failures.dart';
import '../model/OrderEntity.dart';

abstract class CartRepository {
  Future<Either<Failures, OrderEntity>> getCart();

  Future<Either<Failures, OrderEntity>> removeItemFromCart(
      {required String mealId});

  Future<Either<Failures, OrderEntity>> updateCountInCart(
      {required String mealId, required int quantity, required String size});

  Future<Either<Failures, OrderEntity>> addToCart(
      {required String mealId,
      required String restaurantId,
      required int quantity,
      required String size});

  Future<Either<Failures, OrderEntity?>> deleteCart();

  Future<Either<Failures, OrderEntity>> applyCoupon({required String coupon});
}
