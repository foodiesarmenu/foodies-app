import 'package:injectable/injectable.dart';

import '../model/Restaurant.dart';
import '../repositoryContract/home_repository.dart';

@injectable
class GetRestaurantsUsecase {
  HomeRepository restaurantsRepo;

  @factoryMethod
  GetRestaurantsUsecase(this.restaurantsRepo);

  Future<List<Restaurant>?> invoke() {
    return restaurantsRepo.getRestaurants();
  }
}
