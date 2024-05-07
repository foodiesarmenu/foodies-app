import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/delivery_address_repository.dart';
import 'package:injectable/injectable.dart';
import '../failures.dart';
import '../model/DeliveryAddress.dart';

@injectable
class GetPrimaryDeliveryAddressUseCase {
  DeliveryAddressRepository deliveryAddressRepository;

  @factoryMethod
  GetPrimaryDeliveryAddressUseCase(this.deliveryAddressRepository);

  Future<Either<Failures, DeliveryAddress>> invoke() async {
    return await deliveryAddressRepository.getPrimaryDeliveryAddress();
  }
}
