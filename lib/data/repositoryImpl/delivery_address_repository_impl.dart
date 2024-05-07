import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures.dart';
import '../../domain/model/DeliveryAddress.dart';
import '../../domain/repositoryContract/delivery_address_repository.dart';
import '../dataSourceContract/delivery_address_data_source.dart';

@Injectable(as: DeliveryAddressRepository)
class DeliveryAddressRepositoryImpl extends DeliveryAddressRepository{
   DeliveryAddressDataSource dataSource;

   @factoryMethod
  DeliveryAddressRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failures, DeliveryAddress>> getOneDeliveryAddress({required String id}) async {
    return dataSource.getOneDeliveryAddress(id: id);
  }

  @override
  Future<Either<Failures, DeliveryAddress>> getPrimaryDeliveryAddress() async {
    return dataSource.getPrimaryDeliveryAddress();
  }

  @override
  Future<Either<Failures, List<DeliveryAddress>>> getAllDeliveryAddresses() async {
    return dataSource.getAllDeliveryAddresses();
  }

  @override
  Future<Either<Failures, DeliveryAddress>> addDeliveryAddress({required DeliveryAddress deliveryAddress}) async {
    return dataSource.addDeliveryAddress(deliveryAddress: deliveryAddress);
  }

  @override
  Future<Either<Failures, DeliveryAddress>> updateDeliveryAddress({required String addressId,bool? isPrimary, DeliveryAddress? deliveryAddress}) async {
    return dataSource.updateDeliveryAddress(isPrimary: isPrimary, deliveryAddress: deliveryAddress,addressId : addressId);
  }

  @override
  Future<Either<Failures, DeliveryAddress>> deleteDeliveryAddress({required String id}) async {
    return dataSource.deleteDeliveryAddress(id: id);
  }
}