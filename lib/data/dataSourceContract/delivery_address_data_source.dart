import 'package:dartz/dartz.dart';
import '../../domain/failures.dart';
import '../../domain/model/DeliveryAddress.dart';

abstract class DeliveryAddressDataSource {
  Future<Either<Failures, DeliveryAddress>> getOneDeliveryAddress({required String id});
  Future<Either<Failures, DeliveryAddress>> getPrimaryDeliveryAddress();
  Future<Either<Failures, List<DeliveryAddress>>> getAllDeliveryAddresses();
  Future<Either<Failures, DeliveryAddress>> addDeliveryAddress({required DeliveryAddress deliveryAddress});
  Future<Either<Failures, DeliveryAddress>> updateDeliveryAddress({bool? isPrimary,DeliveryAddress? deliveryAddress});
  Future<Either<Failures, DeliveryAddress>> deleteDeliveryAddress({required String id});
}