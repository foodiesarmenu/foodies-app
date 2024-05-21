import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/repositoryContract/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/OrderEntity.dart';
import '../dataSourceContract/cart_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  CartDataSource cartDataSource;

  @factoryMethod
  CartRepositoryImpl(this.cartDataSource);

  @override
  Future<Either<Failures, OrderEntity>> addToCart(
      {required String mealId, required String restaurantId,required int quantity, required String size}) {
    return cartDataSource.addToCart(mealId: mealId, restaurantId: restaurantId, quantity: quantity, size: size);
  }

  @override
  Future<Either<Failures, OrderEntity>> getCart() {
    return cartDataSource.getCart();
  }

  @override
  Future<Either<Failures, OrderEntity>> removeItemFromCart({required String mealId}) {
    return cartDataSource.removeItemFromCart(mealId: mealId);
  }

  @override
  Future<Either<Failures, OrderEntity>> updateCountInCart(
      {required String mealId, required int quantity, required String size}) {
    return cartDataSource.updateCountInCart(
        mealId: mealId, quantity: quantity, size: size);
  }

  @override
  Future<Either<Failures, OrderEntity?>> deleteCart() {
    return cartDataSource.deleteCart();
  }

  @override
  Future<Either<Failures, OrderEntity>> applyCoupon({required String coupon}) {
    return cartDataSource.applyCoupon(coupon: coupon);
  }
}
