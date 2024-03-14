import 'package:injectable/injectable.dart';

import '../model/Restaurant.dart';
import '../repositoryContract/RestaurantsRepo.dart';

@injectable
class GetRestaurantsByCategoryId {
  RestaurantsRepo restaurantsRepo;

  @factoryMethod
  GetRestaurantsByCategoryId(this.restaurantsRepo);

  Future<List<Restaurant>?> invoke(String? categoryId) {
    return restaurantsRepo.getRestaurants(categoryId: categoryId);
  }
}
