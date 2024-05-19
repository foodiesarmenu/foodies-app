import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/domain/model/Restaurant.dart';
import 'package:injectable/injectable.dart';

import '../dataSourceContract/restaurants_data_source.dart';

@Injectable(as: RestaurantsDataSource)
class RestaurantsOnlineDataSourceImpl extends RestaurantsDataSource {
  ApiManager apiManager;

  @factoryMethod
  RestaurantsOnlineDataSourceImpl(this.apiManager);

  @override
  Future<List<Restaurant>?> getRestaurants({String? categoryId}) async {
    var response = await apiManager.getRestaurants(categoryId: categoryId);
    return response.data
        ?.map((restaurantDto) => restaurantDto.toRestaurant())
        .toList();
  }
}
