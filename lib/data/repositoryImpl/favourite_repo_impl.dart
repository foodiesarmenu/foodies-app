import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/dataSourceContract/favourite_data_source.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/FavouriteResponse.dart';
import '../../domain/repositoryContract/favourite_repository.dart';

@Injectable(as: FavouriteRepository)
class FavouriteRepoImpl extends FavouriteRepository {
  FavouriteDataSource favouriteDataSource;

  @factoryMethod
  FavouriteRepoImpl(this.favouriteDataSource);

  @override
  Future<Either<Failures, Favourite>> addToFavourite(
      {required String restaurantId}) async {
    return await favouriteDataSource.addToFavourite(restaurantId: restaurantId);
  }

  @override
  Future<Either<Failures, FavouriteResponse>> getAllFavourites() async {
    return await favouriteDataSource.getAllFavourites();
  }

  @override
  Future<Either<Failures, FavouriteResponse>> checkFavourite(
      {required String restaurantId}) async {
    return await favouriteDataSource.checkFavourite(restaurantId: restaurantId);
  }
}
