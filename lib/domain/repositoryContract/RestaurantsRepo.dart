import '../model/Restaurant.dart';

abstract class RestaurantsRepo {
  Future<List<Restaurant>?> getRestaurants();
}
