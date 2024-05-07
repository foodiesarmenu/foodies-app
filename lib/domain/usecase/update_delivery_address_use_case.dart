import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/delivery_address_repository.dart';
import 'package:injectable/injectable.dart';
import '../failures.dart';
import '../model/DeliveryAddress.dart';

@injectable
class UpdateDeliveryAddressUseCase {
  DeliveryAddressRepository deliveryAddressRepository;

  @factoryMethod
  UpdateDeliveryAddressUseCase(this.deliveryAddressRepository);

  Future<Either<Failures, DeliveryAddress>> invoke({required String addressId,bool? isPrimary,DeliveryAddress? deliveryAddress}) async {
    return await deliveryAddressRepository.updateDeliveryAddress(deliveryAddress: deliveryAddress,isPrimary: isPrimary,addressId : addressId);
  }
}
