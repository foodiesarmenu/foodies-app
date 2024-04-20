import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Cart.dart';
import 'package:injectable/injectable.dart';

import '../dataSourceContract/cart_data_source.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  ApiManager apiManager;

  @factoryMethod
  CartDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, Cart>> addToCart(
      {required String mealId, required String restaurantId}) async {
    var either =
        await apiManager.addToCart(mealId: mealId, restaurantId: restaurantId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.toString()));
    }, (response) {
      return Right(response.data!.toCart());
    });
  }

  @override
  Future<Either<Failures, Cart>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.toString()));
    }, (response) {
      return Right(response.data!.toCart());
    });
  }

  @override
  Future<Either<Failures, Cart>> removeItemFromCart(
      {required String mealId}) async {
    var either = await apiManager.removeItemFromCart(mealId: mealId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toCart());
    });
  }

  @override
  Future<Either<Failures, Cart>> updateCountInCart(
      {required String mealId, required int quantity}) async {
    var either =
        await apiManager.updateCountInCart(mealId: mealId, quantity: quantity);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toCart());
    });
  }

  @override
  Future<Either<Failures, Cart?>> deleteCart() async {
    var either = await apiManager.deleteCart();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data?.toCart());
    });
  }
}
