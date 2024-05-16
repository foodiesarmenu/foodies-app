import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Category.dart';
import 'package:foodies_app/domain/model/Promotion.dart';
import 'package:foodies_app/domain/model/Restaurant.dart';
import 'package:foodies_app/domain/repositoryContract/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../dataSourceContract/CategoriesDataSource.dart';
import '../dataSourceContract/RestaurantsDataSource.dart';
import '../dataSourceContract/home_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeDataSource homeDataSource;

  @factoryMethod
  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<List<Restaurant>?> getRestaurants({String? categoryId}) {
    return homeDataSource.getRestaurants(categoryId: categoryId);
  }

  @override
  Future<List<Category>?> getCategories() {
    return homeDataSource.getCategories();
  }

  @override
  Future<Either<Failures, List<Promotion>>> getAllPromotions() {
    return homeDataSource.getAllPromotions();
  }
}
