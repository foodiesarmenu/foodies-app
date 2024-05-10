import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/delivery_address_repository.dart';
import 'package:injectable/injectable.dart';
import '../failures.dart';
import '../model/DeliveryAddress.dart';

@injectable
class AddDeliveryAddressUseCase {
  DeliveryAddressRepository deliveryAddressRepository;

  @factoryMethod
  AddDeliveryAddressUseCase(this.deliveryAddressRepository);

  Future<Either<Failures, DeliveryAddress>> invoke({required DeliveryAddress deliveryAddress}) async {
    return await deliveryAddressRepository.addDeliveryAddress(deliveryAddress: deliveryAddress);
  }
}
