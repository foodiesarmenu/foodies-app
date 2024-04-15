import 'package:injectable/injectable.dart';

import '../model/Restaurant.dart';
import '../repositoryContract/RestaurantsRepo.dart';

@injectable
class GetRestaurantsUsecase {
  RestaurantsRepo restaurantsRepo;

  @factoryMethod
  GetRestaurantsUsecase(this.restaurantsRepo);

  Future<List<Restaurant>?> invoke() {
    return restaurantsRepo.getRestaurants();
  }
}
