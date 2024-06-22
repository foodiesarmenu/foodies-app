import 'package:dartz/dartz.dart';

import '../../domain/failures.dart';
import '../../domain/model/Menu.dart';
import '../../domain/model/Restaurant.dart';

abstract class MenusDataSource {
  Future<List<Menu>?> getMenus({String? restaurantId});

  Future<Either<Failures, Restaurant>> getRestaurantById(
      {required String restaurantId});
}
