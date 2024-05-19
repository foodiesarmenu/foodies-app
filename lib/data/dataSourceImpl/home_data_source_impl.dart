import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Restaurant.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';
import '../../domain/model/Promotion.dart';
import '../dataSourceContract/home_data_source.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource {
  ApiManager apiManager;

  @factoryMethod
  HomeDataSourceImpl(this.apiManager);

  @override
  Future<List<Restaurant>?> getRestaurants({String? categoryId}) async {
    var response = await apiManager.getRestaurants(categoryId: categoryId);
    return response.data
        ?.map((restaurantDto) => restaurantDto.toRestaurant())
        .toList();
  }

  @override
  Future<List<Category>?> getCategories() async {
    var response = await apiManager.getCategories();
    return response.data
        ?.map((categoryDto) => categoryDto.toCategory())
        .toList();
  }

  @override
  Future<Either<Failures, List<Promotion>>> getAllPromotions() async {
    var either = await apiManager.getAllPromotions();
    return either.fold(
        (l) => Left(l),
        (r) => Right(r.data
                ?.map((promotionDto) => promotionDto.toPromotion())
                .toList() ??
            []));
  }
}
