import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';

import '../model/Category.dart';
import '../model/Promotion.dart';
import '../model/Restaurant.dart';

abstract class HomeRepository {
  Future<List<Restaurant>?> getRestaurants({String? categoryId});

  Future<Either<Failures, List<Promotion>>> getAllPromotions();

  Future<List<Category>?> getCategories();
}
