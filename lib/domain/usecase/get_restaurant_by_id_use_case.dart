import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Restaurant.dart';
import 'package:injectable/injectable.dart';

import '../repositoryContract/menus_repo.dart';

@injectable
class GetRestaurantByIdUseCase {
  MenusRepo menusRepo;

  @factoryMethod
  GetRestaurantByIdUseCase(this.menusRepo);

  Future<Either<Failures, Restaurant>> invoke({required String restaurantId}) {
    return menusRepo.getRestaurantById(restaurantId: restaurantId);
  }
}
