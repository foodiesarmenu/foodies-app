import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/delivery_address_repository.dart';
import 'package:injectable/injectable.dart';
import '../failures.dart';
import '../model/DeliveryAddress.dart';

@injectable
class GetAllDeliveryAddressessUseCase {
  DeliveryAddressRepository deliveryAddressRepository;

  @factoryMethod
  GetAllDeliveryAddressessUseCase(this.deliveryAddressRepository);

  Future<Either<Failures, List<DeliveryAddress>>> invoke() async {
    return await deliveryAddressRepository.getAllDeliveryAddresses();
  }
}
