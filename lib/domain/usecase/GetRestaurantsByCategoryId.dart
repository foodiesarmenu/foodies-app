import 'package:injectable/injectable.dart';

import '../model/Restaurant.dart';
import '../repositoryContract/home_repository.dart';

@injectable
class GetRestaurantsByCategoryId {
  HomeRepository restaurantsRepo;

  @factoryMethod
  GetRestaurantsByCategoryId(this.restaurantsRepo);

  Future<List<Restaurant>?> invoke(String? categoryId) {
    return restaurantsRepo.getRestaurants(categoryId: categoryId);
  }
}
