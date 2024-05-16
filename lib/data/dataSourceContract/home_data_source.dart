import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';

import '../../domain/model/Category.dart';
import '../../domain/model/Promotion.dart';
import '../../domain/model/Restaurant.dart';

abstract class HomeDataSource {
  Future<List<Restaurant>?> getRestaurants({String? categoryId});

  Future<Either<Failures, List<Promotion>>> getAllPromotions();

  Future<List<Category>?> getCategories();
}
