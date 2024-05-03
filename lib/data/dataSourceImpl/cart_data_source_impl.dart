import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/OrderEntity.dart';
import '../dataSourceContract/cart_data_source.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  ApiManager apiManager;

  @factoryMethod
  CartDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, OrderEntity>> addToCart(
      {required String mealId, required String restaurantId,required int quantity, required String size}) async {
    var either =
        await apiManager.addToCart(mealId: mealId, restaurantId: restaurantId, quantity: quantity, size: size);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toOrderEntity());
    });
  }

  @override
  Future<Either<Failures, OrderEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toOrderEntity());
    });
  }

  @override
  Future<Either<Failures, OrderEntity>> removeItemFromCart(
      {required String mealId}) async {
    var either = await apiManager.removeItemFromCart(mealId: mealId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toOrderEntity());
    });
  }

  @override
  Future<Either<Failures, OrderEntity>> updateCountInCart(
      {required String mealId, required int quantity,required String size}) async {
    var either =
        await apiManager.updateCountInCart(mealId: mealId, quantity: quantity, size: size);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage.toString()));
    }, (response) {
      return Right(response.data!.toOrderEntity());
    });
  }

  @override
  Future<Either<Failures, OrderEntity?>> deleteCart() async {
    var either = await apiManager.deleteCart();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data?.toOrderEntity());
    });
  }
}
