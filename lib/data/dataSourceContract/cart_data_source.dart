import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import '../../domain/model/OrderEntity.dart';

abstract class CartDataSource {
  Future<Either<Failures, OrderEntity>> getCart();

  Future<Either<Failures, OrderEntity>> removeItemFromCart({required String mealId});

  Future<Either<Failures, OrderEntity>> updateCountInCart(
      {required String mealId, required int quantity});

  Future<Either<Failures, OrderEntity>> addToCart(
      {required String mealId, required String restaurantId});

  Future<Either<Failures, OrderEntity?>> deleteCart();
}
