import '../../domain/model/Restaurant.dart';

abstract class RestaurantsDataSource {
  Future<List<Restaurant>?> getRestaurants();
}
