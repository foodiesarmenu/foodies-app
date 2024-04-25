import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:foodies_app/domain/model/OnlineOrder.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/CashOrder.dart';
import '../dataSourceContract/order_data_soruce.dart';

@Injectable(as: OrderDataSource)
class OrderDataSourceImpl extends OrderDataSource {
  ApiManager apiManager;

  @factoryMethod
  OrderDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, OnlineOrder>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress}) async {
    var either =
        await apiManager.createOnlineOrder(deliveryAddress: deliveryAddress);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toOnlineOrder());
    });
  }

  @override
  Future<Either<Failures, OnlineOrder>> deleteOrder() {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, OnlineOrder>> getOrder() {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, OnlineOrder>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, OnlineOrder>> updateOrder() {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CashOrder>> createCashOrder(
      {required DeliveryAddress deliveryAddress}) async {
    var either =
        await apiManager.createCashOrder(deliveryAddress: deliveryAddress);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toCashOrder());
    });
  }
}
