import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/OrderEntity.dart';
import '../repositoryContract/cart_repository.dart';

@injectable
class ApplyCouponUseCase {
  CartRepository cartRepository;

  @factoryMethod
  ApplyCouponUseCase(this.cartRepository);

  Future<Either<Failures, OrderEntity?>> invoke(
      {required String coupon}) async {
    return await cartRepository.applyCoupon(coupon: coupon);
  }
}
