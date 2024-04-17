import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Cart.dart';
import 'package:foodies_app/domain/repositoryContract/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../dataSourceContract/cart_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  CartDataSource cartDataSource;

  @factoryMethod
  CartRepositoryImpl(this.cartDataSource);

  @override
  Future<Either<Failures, Cart>> addToCart(
      {required String mealId, required String restaurantId}) {
    return cartDataSource.addToCart(mealId: mealId, restaurantId: restaurantId);
  }

  @override
  Future<Either<Failures, Cart>> getCart() {
    return cartDataSource.getCart();
  }

  @override
  Future<Either<Failures, Cart>> removeItemFromCart({required String mealId}) {
    return cartDataSource.removeItemFromCart(mealId: mealId);
  }

  @override
  Future<Either<Failures, Cart>> updateCountInCart(
      {required String mealId, required int quantity}) {
    return cartDataSource.updateCountInCart(mealId: mealId, quantity: quantity);
  }

  @override
  Future<Either<Failures, Cart?>> deleteCart() {
    return cartDataSource.deleteCart();
  }
}
