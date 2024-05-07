import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/data/dataSourceContract/delivery_address_data_source.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: DeliveryAddressDataSource)
class DeliveryAddressDataSourceImpl extends DeliveryAddressDataSource {
  ApiManager apiManager;
  @factoryMethod
  DeliveryAddressDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, DeliveryAddress>> addDeliveryAddress({required DeliveryAddress deliveryAddress}) async {
    var either = await apiManager.addDeliveryAddress(deliveryAddress: deliveryAddress);

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data!.toDeliveryAddress());
    });
  }

  @override
  Future<Either<Failures, DeliveryAddress>> deleteDeliveryAddress({required String id}) async {
    var either = await apiManager.deleteDeliveryAddress(id: id);

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data?.toDeliveryAddress() ?? DeliveryAddress());
    });
  }

  @override
  Future<Either<Failures, List<DeliveryAddress>>> getAllDeliveryAddresses() async {
    var either = await apiManager.getAllAddressess();

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data!.map((e) => e.toDeliveryAddress()).toList());
    });
  }

  @override
  Future<Either<Failures, DeliveryAddress>> getOneDeliveryAddress({required String id}) {
    // TODO: implement getOneDeliveryAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, DeliveryAddress>> getPrimaryDeliveryAddress() async {
    var either = await apiManager.getPrimaryAddress();

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data!.toDeliveryAddress());
    });
  }

  @override
  Future<Either<Failures, DeliveryAddress>> updateDeliveryAddress({required String addressId,bool? isPrimary, DeliveryAddress? deliveryAddress}) async {
    var either = await apiManager.updateDeliveryAddress(isPrimary: isPrimary, deliveryAddress: deliveryAddress, addressId: addressId);

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data!.toDeliveryAddress());
    });
  }

}