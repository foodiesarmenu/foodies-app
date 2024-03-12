import 'package:foodies_app/domain/model/Restaurant.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoryContract/RestaurantsRepo.dart';
import '../dataSourceContract/RestaurantsDataSource.dart';

@Injectable(as: RestaurantsRepo)
class RestaurantsRepoImpl extends RestaurantsRepo {
  RestaurantsDataSource restaurantsOnlineDataSource;

  @factoryMethod
  RestaurantsRepoImpl(this.restaurantsOnlineDataSource);

  @override
  Future<List<Restaurant>?> getRestaurants() {
    return restaurantsOnlineDataSource.getRestaurants();
  }
}
