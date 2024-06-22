import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Menu.dart';
import 'package:foodies_app/domain/model/Restaurant.dart';
import 'package:injectable/injectable.dart';

import '../api_manager.dart';
import '../dataSourceContract/menus_data_source.dart';

@Injectable(as: MenusDataSource)
class MenusOnlineDataSourceImpl extends MenusDataSource {
  ApiManager apiManager;

  @factoryMethod
  MenusOnlineDataSourceImpl({required this.apiManager});

  @override
  Future<List<Menu>?> getMenus({String? restaurantId}) async {
    var response = await apiManager.getMenus(restaurantId: restaurantId);
    return response.data?.map((menuDto) => menuDto.toMenu()).toList();
  }

  @override
  Future<Either<Failures, Restaurant>> getRestaurantById(
      {required String restaurantId}) async {
    var either = await apiManager.getRestaurantById(restaurantId: restaurantId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.data!.toRestaurant());
    });
  }
}
