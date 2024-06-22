import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/Restaurant.dart';

import '../failures.dart';
import '../model/Menu.dart';

abstract class MenusRepo {
  Future<List<Menu>?> getMenus({String? restaurantId});

  Future<Either<Failures, Restaurant>> getRestaurantById(
      {required String restaurantId});
}
