import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/delivery_address_repository.dart';
import 'package:injectable/injectable.dart';
import '../failures.dart';
import '../model/DeliveryAddress.dart';

@injectable
class DeleteDeliveryAddressUseCase {
  DeliveryAddressRepository deliveryAddressRepository;

  @factoryMethod
  DeleteDeliveryAddressUseCase(this.deliveryAddressRepository);

  Future<Either<Failures, DeliveryAddress>> invoke({required String id}) async {
    return await deliveryAddressRepository.deleteDeliveryAddress(id: id);
  }
}
