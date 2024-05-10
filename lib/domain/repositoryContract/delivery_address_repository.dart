import 'package:dartz/dartz.dart';

import '../failures.dart';
import '../model/DeliveryAddress.dart';

abstract class DeliveryAddressRepository {
  Future<Either<Failures, DeliveryAddress>> getOneDeliveryAddress({required String id});
  Future<Either<Failures, DeliveryAddress>> getPrimaryDeliveryAddress();
  Future<Either<Failures, List<DeliveryAddress>>> getAllDeliveryAddresses();
  Future<Either<Failures, DeliveryAddress>> addDeliveryAddress({required DeliveryAddress deliveryAddress});
  Future<Either<Failures, DeliveryAddress>> updateDeliveryAddress({required String addressId,bool? isPrimary,DeliveryAddress? deliveryAddress});
  Future<Either<Failures, DeliveryAddress>> deleteDeliveryAddress({required String id});
}